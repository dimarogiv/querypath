if (( $+commands[querypath] )); then
  eval "$(querypath init zsh)"
else
  echo 'querypath: command not found, please install it from https://github.com/dimarogiv/querypath'
fi
