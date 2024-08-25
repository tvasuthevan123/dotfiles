function prompt_long_pwd --description 'print the current working directory'
    echo (string split -r -m 1 / $PWD)[2]
end

