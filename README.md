# querypath

querypath is a **path matcher**, forked from [https://github.com/ajeetdsouza/zoxide](zoxide).

It remembers which paths you use most frequently, so you can match
them in just a few keystrokes.<br />

[Getting started](#getting-started) •
[Installation](#installation) •
[Configuration](#configuration) •
[Integrations](#third-party-integrations)

## Getting started

```sh
cat $(q ~/.config/nvim/init.lua) # `cat` `init.lua` while adding a new entry into the database
ls $(q foo.txt)    # `ls` the highest ranked file matching foo
vim $(q foo bar)   # edit the highest ranked file with a path matching foo and bar
cd $(q foo /)      # cd into a subdirectory starting with foo
ls -l $(q -)       # view metadata of the previous matched path

vim $(qi foo)      # choose file with interactive selection (using fzf) before editing

q foo<SPACE><TAB>  # show interactive completions (querypath v0.8.0+, bash 4.4+/fish/zsh only)
```

## Installation

querypath can be installed in 4 easy steps:

1. **Install binary**

   querypath runs on most major platforms.

   <details>
   <summary>Linux / WSL</summary>

   > The recommended way to install querypath is via the install script:
   >
   > ```sh
   > curl -sSfL https://raw.githubusercontent.com/dimarogiv/querypath/main/install.sh | sh
   > ```
   </details>

   <details>
   <summary>macOS</summary>

   > To install querypath, run this command in your terminal:
   >
   > ```sh
   > curl -sSfL https://raw.githubusercontent.com/dimarogiv/querypath/main/install.sh | sh
   > ```

   </details>

2. **Setup querypath on your shell**

   To start using querypath, add it to your shell.

   <details>
   <summary>Zsh</summary>

   > Add this to the <ins>**end**</ins> of your config file (usually `~/.zshrc`):
   >
   > ```sh
   > eval "$(querypath init zsh)"
   > ```
   >
   > For completions to work, the above line must be added _after_ `compinit` is
   > called. You may have to rebuild your completions cache by running
   > `rm ~/.zcompdump*; compinit`.

   </details>

   <details>
   <summary>Any POSIX shell</summary>

   > Add this to the <ins>**end**</ins> of your config file:
   >
   > ```sh
   > eval "$(querypath init --cmd q posix)"
   > ```

   </details>

3. **Install fzf** <sup>(optional)</sup>

   [fzf] is a command-line fuzzy finder, used by querypath for completions /
   interactive selection. It can be installed from [here][fzf-installation].

   > **Note**
   > The minimum supported fzf version is v0.51.0.

4. **Import your data** <sup>(optional)</sup>

   If you currently use any of these plugins, you may want to import your data
   into querypath:

   <details>
   <summary>autojump</summary>

   > Run this command in your terminal:
   >
   > ```sh
   > querypath import --from=autojump "/path/to/autojump/db"
   > ```
   >
   > The path usually varies according to your system:
   >
   > | OS      | Path                                                                                 | Example                                                |
   > | ------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------ |
   > | Linux   | `$XDG_DATA_HOME/autojump/autojump.txt` or `$HOME/.local/share/autojump/autojump.txt` | `/home/alice/.local/share/autojump/autojump.txt`       |
   > | macOS   | `$HOME/Library/autojump/autojump.txt`                                                | `/Users/Alice/Library/autojump/autojump.txt`           |
   > | Windows | `%APPDATA%\autojump\autojump.txt`                                                    | `C:\Users\Alice\AppData\Roaming\autojump\autojump.txt` |

   </details>

   <details>
   <summary>fasd, z, z.lua, zsh-z</summary>

   > Run this command in your terminal:
   >
   > ```sh
   > querypath import --from=z "path/to/z/db"
   > ```
   >
   > The path usually varies according to your system:
   >
   > | Plugin           | Path                                                                                |
   > | ---------------- | ----------------------------------------------------------------------------------- |
   > | fasd             | `$_FASD_DATA` or `$HOME/.fasd`                                                      |
   > | z (bash/zsh)     | `$_Z_DATA` or `$HOME/.z`                                                            |
   > | z (fish)         | `$Z_DATA` or `$XDG_DATA_HOME/z/data` or `$HOME/.local/share/z/data`                 |
   > | z.lua (bash/zsh) | `$_ZL_DATA` or `$HOME/.zlua`                                                        |
   > | z.lua (fish)     | `$XDG_DATA_HOME/zlua/zlua.txt` or `$HOME/.local/share/zlua/zlua.txt` or `$_ZL_DATA` |
   > | zsh-z            | `$ZSHZ_DATA` or `$_Z_DATA` or `$HOME/.z`                                            |

   </details>

   <details>
   <summary>ZLocation</summary>

   > Run this command in PowerShell:
   >
   > ```powershell
   > $db = New-TemporaryFile
   > (Get-ZLocation).GetEnumerator() | ForEach-Object { Write-Output ($_.Name+'|'+$_.Value+'|0') } | Out-File $db
   > querypath import --from=z $db
   > ```

   </details>

## Configuration

### Flags

When calling `querypath init --cmd q`, the following flags are available:

- `--cmd`
  - Changes the prefix of the `q` and `qi` commands.
  - `--cmd j` would change the commands to (`j`, `ji`).
  - `--cmd cd` would replace the `cd` command.

### Environment variables

Environment variables[^2] can be used for configuration. They must be set before
`querypath init` is called.

- `_QP_DATA_DIR`
  - Specifies the directory in which the database is stored.
  - The default value varies across OSes:

    | OS          | Path                                     | Example                                    |
    | ----------- | ---------------------------------------- | ------------------------------------------ |
    | Linux / BSD | `$XDG_DATA_HOME` or `$HOME/.local/share` | `/home/alice/.local/share`                 |
    | macOS       | `$HOME/Library/Application Support`      | `/Users/Alice/Library/Application Support` |

- `_QP_ECHO`
  - When set to 1, `q` will print the matched path before outputting it.
- `_QP_EXCLUDE_DIRS`
  - Excludes the specified paths from the database.
  - This is provided as a list of [globs][glob], separated by OS-specific
    characters:

    | OS                  | Separator | Example                 |
    | ------------------- | --------- | ----------------------- |
    | Linux / macOS / BSD | `:`       | `$HOME:$HOME/private/*` |

  - By default, this is set to `"$HOME"`.
- `_QP_FZF_OPTS`
  - Custom options to pass to [fzf] during interactive selection. See
    [`man fzf`][fzf-man] for the list of options.
- `_QP_MAXAGE`
  - Configures the [aging algorithm][algorithm-aging], which limits the maximum
    number of entries in the database.
  - By default, this is set to 10000.
- `_QP_RESOLVE_SYMLINKS`
  - When set to 1, `q` will resolve symlinks before adding paths to the
    database.

    *Forked from [https://github.com/ajeetdsouza/zoxide](zoxide). @ajeetdsouza
    thank you for such a great project! Just decided to make it more universal,
    not only for navigation.*
