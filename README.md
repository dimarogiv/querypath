<!-- markdownlint-configure-file {
  "MD013": {
    "code_blocks": false,
    "tables": false
  },
  "MD033": false,
  "MD041": false
} -->

<div align="center">

<sup>Special thanks to:</sup>

<div><img src="contrib/warp.png" width="230" alt="Warp" /></div>
<div><sup><b>Warp, the intelligent terminal</b></sup></div>
<div><sup>Available for MacOS, Linux, and Windows</sup></div>
<div><sup>
  Visit
  <a href="https://www.warp.dev/?utm_source=github&utm_medium=referral&utm_campaign=querypath_20231001"><u>warp.dev</u></a>
  to learn more.
</sup></div>

<hr />

# querypath

[![crates.io][crates.io-badge]][crates.io]
[![Downloads][downloads-badge]][releases]
[![Built with Nix][builtwithnix-badge]][builtwithnix]

querypath is a **smarter cd command**, inspired by z and autojump.

It remembers which directories you use most frequently, so you can "jump" to
them in just a few keystrokes.<br />
querypath works on all major shells.

[Getting started](#getting-started) •
[Installation](#installation) •
[Configuration](#configuration) •
[Integrations](#third-party-integrations)

</div>

## Getting started

![Tutorial][tutorial]

```sh
z foo              # cd into highest ranked directory matching foo
z foo bar          # cd into highest ranked directory matching foo and bar
z foo /            # cd into a subdirectory starting with foo

z ~/foo            # z also works like a regular cd command
z foo/             # cd into relative path
z ..               # cd one level up
z -                # cd into previous directory

zi foo             # cd with interactive selection (using fzf)

z foo<SPACE><TAB>  # show interactive completions (querypath v0.8.0+, bash 4.4+/fish/zsh only)
```

Read more about the matching algorithm [here][algorithm-matching].

<a href="https://app.warp.dev/drive/folder/querypath-EyHNpQumHVWNcYB8GJgDxG?utm_source=github&utm_medium=warp_pack&utm_campaign=querypath_20231001">
  <img src="contrib/warp-packs-green.png" alt="Follow tutorial in Warp">
</a>

## Installation

querypath can be installed in 4 easy steps:

1. **Install binary**

   querypath runs on most major platforms. If your platform isn't listed below,
   please [open an issue][issues].

   <details>
   <summary>Linux / WSL</summary>

   > The recommended way to install querypath is via the install script:
   >
   > ```sh
   > curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/querypath/main/install.sh | sh
   > ```
   >
   > Or, you can use a package manager:
   >
   > | Distribution        | Repository                | Instructions                                                                                          |
   > | ------------------- | ------------------------- | ----------------------------------------------------------------------------------------------------- |
   > | **_Any_**           | **[crates.io]**           | `cargo install querypath --locked`                                                                       |
   > | _Any_               | [asdf]                    | `asdf plugin add querypath https://github.com/nyrst/asdf-querypath.git` <br /> `asdf install querypath latest` |
   > | _Any_               | [conda-forge]             | `conda install -c conda-forge querypath`                                                                 |
   > | _Any_               | [guix]                    | `guix install querypath`                                                                                 |
   > | _Any_               | [Linuxbrew]               | `brew install querypath`                                                                                 |
   > | _Any_               | [nixpkgs]                 | `nix-env -iA nixpkgs.querypath`                                                                          |
   > | AlmaLinux           |                           | `dnf install querypath`                                                                                  |
   > | Alpine Linux 3.13+  | [Alpine Linux Packages]   | `apk add querypath`                                                                                      |
   > | Arch Linux          | [Arch Linux Extra]        | `pacman -S querypath`                                                                                    |
   > | CentOS Stream       |                           | `dnf install querypath`                                                                                  |
   > | ~Debian 11+~[^1]    | ~[Debian Packages]~       | ~`apt install querypath`~                                                                                |
   > | Devuan 4.0+         | [Devuan Packages]         | `apt install querypath`                                                                                  |
   > | Exherbo Linux       | [Exherbo packages]        | `cave resolve -x repository/rust` <br /> `cave resolve -x querypath`                                     |
   > | Fedora 32+          | [Fedora Packages]         | `dnf install querypath`                                                                                  |
   > | Gentoo              | [Gentoo Packages]         | `emerge app-shells/querypath`                                                                            |
   > | Linux Mint          | [apt.cli.rs] (unofficial) | [Setup the repository][apt.cli.rs-setup], then `apt install querypath`                                   |
   > | Manjaro             |                           | `pacman -S querypath`                                                                                    |
   > | openSUSE Tumbleweed | [openSUSE Factory]        | `zypper install querypath`                                                                               |
   > | ~Parrot OS~[^1]     |                           | ~`apt install querypath`~                                                                                |
   > | ~Raspbian 11+~[^1]  | ~[Raspbian Packages]~     | ~`apt install querypath`~                                                                                |
   > | RHEL 8+             |                           | `dnf install querypath`                                                                                  |
   > | Rhino Linux         | [Pacstall Packages]       | `pacstall -I querypath-deb`                                                                              |
   > | Rocky Linux         |                           | `dnf install querypath`                                                                                  |
   > | Slackware 15.0+     | [SlackBuilds]             | [Instructions][slackbuilds-howto]                                                                     |
   > | Solus               | [Solus Packages]          | `eopkg install querypath`                                                                                |
   > | Ubuntu              | [apt.cli.rs] (unofficial) | [Setup the repository][apt.cli.rs-setup], then `apt install querypath`                                   |
   > | Void Linux          | [Void Linux Packages]     | `xbps-install -S querypath`                                                                              |

   </details>

   <details>
   <summary>macOS</summary>

   > To install querypath, use a package manager:
   >
   > | Repository      | Instructions                                                                                          |
   > | --------------- | ----------------------------------------------------------------------------------------------------- |
   > | **[crates.io]** | `cargo install querypath --locked`                                                                       |
   > | **[Homebrew]**  | `brew install querypath`                                                                                 |
   > | [asdf]          | `asdf plugin add querypath https://github.com/nyrst/asdf-querypath.git` <br /> `asdf install querypath latest` |
   > | [conda-forge]   | `conda install -c conda-forge querypath`                                                                 |
   > | [MacPorts]      | `port install querypath`                                                                                 |
   > | [nixpkgs]       | `nix-env -iA nixpkgs.querypath`                                                                          |
   >
   > Or, run this command in your terminal:
   >
   > ```sh
   > curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/querypath/main/install.sh | sh
   > ```

   </details>

   <details>
   <summary>Windows</summary>

   > querypath works with PowerShell, as well as shells running in Cygwin, Git
   > Bash, and MSYS2.
   >
   > The recommended way to install querypath is via `winget`:
   >
   > ```sh
   > winget install ajeetdsouza.querypath
   > ```
   >
   > Or, you can use an alternative package manager:
   >
   > | Repository      | Instructions                          |
   > | --------------- | ------------------------------------- |
   > | **[crates.io]** | `cargo install querypath --locked`       |
   > | [Chocolatey]    | `choco install querypath`                |
   > | [conda-forge]   | `conda install -c conda-forge querypath` |
   > | [Scoop]         | `scoop install querypath`                |
   >
   > If you're using Cygwin, Git Bash, or MSYS2, you can also use the install script:
   >
   > ```sh
   > curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/querypath/main/install.sh | sh
   > ```

   </details>

   <details>
   <summary>BSD</summary>

   > To install querypath, use a package manager:
   >
   > | Distribution  | Repository      | Instructions                    |
   > | ------------- | --------------- | ------------------------------- |
   > | **_Any_**     | **[crates.io]** | `cargo install querypath --locked` |
   > | DragonFly BSD | [DPorts]        | `pkg install querypath`            |
   > | FreeBSD       | [FreshPorts]    | `pkg install querypath`            |
   > | NetBSD        | [pkgsrc]        | `pkgin install querypath`          |
   >
   > Or, run this command in your terminal:
   >
   > ```sh
   > curl -sS https://raw.githubusercontent.com/ajeetdsouza/querypath/main/install.sh | bash
   > ```

   </details>

   <details>
   <summary>Android</summary>

   > To install querypath, use a package manager:
   >
   > | Repository | Instructions         |
   > | ---------- | -------------------- |
   > | [Termux]   | `pkg install querypath` |
   >
   > Or, run this command in your terminal:
   >
   > ```sh
   > curl -sS https://raw.githubusercontent.com/ajeetdsouza/querypath/main/install.sh | bash
   > ```

   </details>

2. **Setup querypath on your shell**

   To start using querypath, add it to your shell.

   <details>
   <summary>Bash</summary>

   > Add this to the <ins>**end**</ins> of your config file (usually `~/.bashrc`):
   >
   > ```sh
   > eval "$(querypath init bash)"
   > ```

   </details>

   <details>
   <summary>Elvish</summary>

   > Add this to the <ins>**end**</ins> of your config file (usually `~/.elvish/rc.elv`):
   >
   > ```sh
   > eval (querypath init elvish | slurp)
   > ```
   >
   > **Note**
   > querypath only supports elvish v0.18.0 and above.

   </details>

   <details>
   <summary>Fish</summary>

   > Add this to the <ins>**end**</ins> of your config file (usually
   > `~/.config/fish/config.fish`):
   >
   > ```sh
   > querypath init fish | source
   > ```

   </details>

   <details>
   <summary>Nushell</summary>

   > Add this to the <ins>**end**</ins> of your env file (find it by running `$nu.env-path`
   > in Nushell):
   >
   > ```sh
   > querypath init nushell | save -f ~/.querypath.nu
   > ```
   >
   > Now, add this to the <ins>**end**</ins> of your config file (find it by running
   > `$nu.config-path` in Nushell):
   >
   > ```sh
   > source ~/.querypath.nu
   > ```
   >
   > **Note**
   > querypath only supports Nushell v0.89.0+.

   </details>

   <details>
   <summary>PowerShell</summary>

   > Add this to the <ins>**end**</ins> of your config file (find it by running
   > `echo $profile` in PowerShell):
   >
   > ```powershell
   > Invoke-Expression (& { (querypath init powershell | Out-String) })
   > ```

   </details>

   <details>
   <summary>Tcsh</summary>

   > Add this to the <ins>**end**</ins> of your config file (usually `~/.tcshrc`):
   >
   > ```sh
   > querypath init tcsh > ~/.querypath.tcsh
   > source ~/.querypath.tcsh
   > ```

   </details>

   <details>
   <summary>Xonsh</summary>

   > Add this to the <ins>**end**</ins> of your config file (usually `~/.xonshrc`):
   >
   > ```python
   > execx($(querypath init xonsh), 'exec', __xonsh__.ctx, filename='querypath')
   > ```

   </details>

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
   > eval "$(querypath init posix --hook prompt)"
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

When calling `querypath init`, the following flags are available:

- `--cmd`
  - Changes the prefix of the `z` and `zi` commands.
  - `--cmd j` would change the commands to (`j`, `ji`).
  - `--cmd cd` would replace the `cd` command.
- `--hook <HOOK>`
  - Changes how often querypath increments a directory's score:

    | Hook            | Description                       |
    | --------------- | --------------------------------- |
    | `none`          | Never                             |
    | `prompt`        | At every shell prompt             |
    | `pwd` (default) | Whenever the directory is changed |

- `--no-cmd`
  - Prevents querypath from defining the `z` and `zi` commands.
  - These functions will still be available in your shell as `__querypath_z` and
    `__querypath_zi`, should you choose to redefine them.

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
    | Windows     | `%LOCALAPPDATA%`                         | `C:\Users\Alice\AppData\Local`             |

- `_QP_ECHO`
  - When set to 1, `z` will print the matched directory before navigating to
    it.
- `_QP_EXCLUDE_DIRS`
  - Excludes the specified directories from the database.
  - This is provided as a list of [globs][glob], separated by OS-specific
    characters:

    | OS                  | Separator | Example                 |
    | ------------------- | --------- | ----------------------- |
    | Linux / macOS / BSD | `:`       | `$HOME:$HOME/private/*` |
    | Windows             | `;`       | `$HOME;$HOME/private/*` |

  - By default, this is set to `"$HOME"`.
- `_QP_FZF_OPTS`
  - Custom options to pass to [fzf] during interactive selection. See
    [`man fzf`][fzf-man] for the list of options.
- `_QP_MAXAGE`
  - Configures the [aging algorithm][algorithm-aging], which limits the maximum
    number of entries in the database.
  - By default, this is set to 10000.
- `_QP_RESOLVE_SYMLINKS`
  - When set to 1, `z` will resolve symlinks before adding directories to the
    database.

## Third-party integrations

| Application           | Description                                  | Plugin                     |
| --------------------- | -------------------------------------------- | -------------------------- |
| [aerc]                | Email client                                 | Natively supported         |
| [alfred]              | macOS launcher                               | [alfred-querypath]            |
| [clink]               | Improved cmd.exe for Windows                 | [clink-querypath]             |
| [emacs]               | Text editor                                  | [querypath.el]                |
| [felix]               | File manager                                 | Natively supported         |
| [joshuto]             | File manager                                 | Natively supported         |
| [lf]                  | File manager                                 | See the [wiki][lf-wiki]    |
| [nnn]                 | File manager                                 | [nnn-autojump]             |
| [ranger]              | File manager                                 | [ranger-querypath]            |
| [rfm]                 | File manager                                 | Natively supported         |
| [sesh]                | `tmux` session manager                       | Natively supported         |
| [telescope.nvim]      | Fuzzy finder for Neovim                      | [telescope-querypath]         |
| [tmux-session-wizard] | `tmux` session manager                       | Natively supported         |
| [tmux-sessionx]       | `tmux` session manager                       | Natively supported         |
| [vim] / [neovim]      | Text editor                                  | [querypath.vim]               |
| [xplr]                | File manager                                 | [querypath.xplr]              |
| [xxh]                 | Transports shell configuration over SSH      | [xxh-plugin-prerun-querypath] |
| [yazi]                | File manager                                 | Natively supported         |
| [zabb]                | Finds the shortest possible query for a path | Natively supported         |
| [zesh]                | `zellij` session manager                     | Natively supported         |
| [zsh-autocomplete]    | Realtime completions for zsh                 | Natively supported         |

[^1]:
    Debian and its derivatives update their packages very slowly. If you're
    using one of these distributions, consider using the install script instead.

[^2]:
    If you're not sure how to set an environment variable on your shell, check
    out the [wiki][wiki-env].

[aerc]: https://github.com/rjarry/aerc
[alfred]: https://www.alfredapp.com/
[alfred-querypath]: https://github.com/yihou/alfred-querypath
[algorithm-aging]: https://github.com/ajeetdsouza/querypath/wiki/Algorithm#aging
[algorithm-matching]: https://github.com/ajeetdsouza/querypath/wiki/Algorithm#matching
[alpine linux packages]: https://pkgs.alpinelinux.org/packages?name=querypath
[apt.cli.rs]: https://apt.cli.rs/
[apt.cli.rs-setup]: https://github.com/emmatyping/apt.cli.rs#how-to-add-the-repo
[arch linux extra]: https://archlinux.org/packages/extra/x86_64/querypath/
[asdf]: https://github.com/asdf-vm/asdf
[builtwithnix-badge]: https://img.shields.io/badge/builtwith-nix-7d81f7?logo=nixos&logoColor=white&style=flat-square
[builtwithnix]: https://builtwithnix.org/
[chocolatey]: https://community.chocolatey.org/packages/querypath
[clink-querypath]: https://github.com/shunsambongi/clink-querypath
[clink]: https://github.com/mridgers/clink
[conda-forge]: https://anaconda.org/conda-forge/querypath
[crates.io-badge]: https://img.shields.io/crates/v/querypath?logo=rust&logoColor=white&style=flat-square
[crates.io]: https://crates.io/crates/querypath
[debian packages]: https://packages.debian.org/stable/admin/querypath
[exherbo packages]: https://gitlab.exherbo.org/exherbo/rust/-/tree/master/packages/sys-apps/querypath
[devuan packages]: https://pkginfo.devuan.org/cgi-bin/package-query.html?c=package&q=querypath
[downloads-badge]: https://img.shields.io/github/downloads/ajeetdsouza/querypath/total?logo=github&logoColor=white&style=flat-square
[dports]: https://github.com/DragonFlyBSD/DPorts/tree/master/sysutils/querypath
[emacs]: https://www.gnu.org/software/emacs/
[fedora packages]: https://src.fedoraproject.org/rpms/rust-querypath
[felix]: https://github.com/kyoheiu/felix
[freshports]: https://www.freshports.org/sysutils/querypath/
[fzf-installation]: https://github.com/junegunn/fzf#installation
[fzf-man]: https://manpages.ubuntu.com/manpages/en/man1/fzf.1.html
[fzf]: https://github.com/junegunn/fzf
[gentoo packages]: https://packages.gentoo.org/packages/app-shells/querypath
[glob]: https://man7.org/linux/man-pages/man7/glob.7.html
[guix]: https://packages.guix.gnu.org/packages/querypath/
[homebrew]: https://formulae.brew.sh/formula/querypath
[issues]: https://github.com/ajeetdsouza/querypath/issues/new
[joshuto]: https://github.com/kamiyaa/joshuto
[lf]: https://github.com/gokcehan/lf
[lf-wiki]: https://github.com/gokcehan/lf/wiki/Integrations#querypath
[linuxbrew]: https://formulae.brew.sh/formula-linux/querypath
[macports]: https://ports.macports.org/port/querypath/summary
[neovim]: https://github.com/neovim/neovim
[nixpkgs]: https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/zo/querypath/package.nix
[nnn-autojump]: https://github.com/jarun/nnn/blob/master/plugins/autojump
[nnn]: https://github.com/jarun/nnn
[opensuse factory]: https://build.opensuse.org/package/show/openSUSE:Factory/querypath
[pacstall packages]: https://pacstall.dev/packages/querypath-deb
[pkgsrc]: https://pkgsrc.se/sysutils/querypath
[ranger-querypath]: https://github.com/jchook/ranger-querypath
[ranger]: https://github.com/ranger/ranger
[raspbian packages]: https://archive.raspbian.org/raspbian/pool/main/r/rust-querypath/
[releases]: https://github.com/ajeetdsouza/querypath/releases
[rfm]: https://github.com/dsxmachina/rfm
[scoop]: https://github.com/ScoopInstaller/Main/tree/master/bucket/querypath.json
[sesh]: https://github.com/joshmedeski/sesh
[slackbuilds]: https://slackbuilds.org/repository/15.0/system/querypath/
[slackbuilds-howto]: https://slackbuilds.org/howto/
[solus packages]: https://github.com/getsolus/packages/tree/main/packages/z/querypath/
[telescope-querypath]: https://github.com/jvgrootveld/telescope-querypath
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[termux]: https://github.com/termux/termux-packages/tree/master/packages/querypath
[tmux-session-wizard]: https://github.com/27medkamal/tmux-session-wizard
[tmux-sessionx]: https://github.com/omerxx/tmux-sessionx
[tutorial]: contrib/tutorial.webp
[vim]: https://github.com/vim/vim
[void linux packages]: https://github.com/void-linux/void-packages/tree/master/srcpkgs/querypath
[wiki-env]: https://github.com/ajeetdsouza/querypath/wiki/HOWTO:-set-environment-variables "HOWTO: set environment variables"
[xplr]: https://github.com/sayanarijit/xplr
[xxh-plugin-prerun-querypath]: https://github.com/xxh/xxh-plugin-prerun-querypath
[xxh]: https://github.com/xxh/xxh
[yazi]: https://github.com/sxyazi/yazi
[zabb]: https://github.com/Mellbourn/zabb
[zesh]: https://github.com/roberte777/zesh
[querypath.el]: https://gitlab.com/Vonfry/querypath.el
[querypath.vim]: https://github.com/nanotee/querypath.vim
[querypath.xplr]: https://github.com/sayanarijit/querypath.xplr
[zsh-autocomplete]: https://github.com/marlonrichert/zsh-autocomplete
