module completions {

  # A smarter cd command for your terminal
  export extern querypath [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Add a new directory or increment its rank
  export extern "querypath add" [
    ...paths: path
    --score(-s): string       # The rank to increment the entry if it exists or initialize it with if it doesn't
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Edit the database
  export extern "querypath edit" [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  export extern "querypath edit decrement" [
    path: string
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  export extern "querypath edit delete" [
    path: string
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  export extern "querypath edit increment" [
    path: string
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  export extern "querypath edit reload" [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  def "nu-complete querypath import from" [] {
    [ "autojump" "z" ]
  }

  # Import entries from another application
  export extern "querypath import" [
    path: path
    --from: string@"nu-complete querypath import from" # Application to import from
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  def "nu-complete querypath init shell" [] {
    [ "bash" "elvish" "fish" "nushell" "posix" "powershell" "tcsh" "xonsh" "zsh" ]
  }

  def "nu-complete querypath init hook" [] {
    [ "none" "prompt" "pwd" ]
  }

  # Generate shell configuration
  export extern "querypath init" [
    shell: string@"nu-complete querypath init shell"
    --no-cmd                  # Prevents querypath from defining the `z` and `zi` commands
    --cmd: string             # Changes the prefix of the `z` and `zi` commands
    --hook: string@"nu-complete querypath init hook" # Changes how often querypath increments a directory's score
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Search for a directory in the database
  export extern "querypath query" [
    ...keywords: string
    --all(-a)                 # Show unavailable directories
    --interactive(-i)         # Use interactive selection
    --list(-l)                # List all matching directories
    --score(-s)               # Print score with results
    --exclude: path           # Exclude the current directory
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Remove a directory from the database
  export extern "querypath remove" [
    ...paths: path
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

}

export use completions *
