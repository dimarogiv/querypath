if command -sq querypath
    querypath init fish | source
else
    echo 'querypath: command not found, please install it from https://github.com/dimarogiv/querypath'
end
