function fish_prompt -d "Write out the prompt"

    # User name
    printf '%s%s%s' (set_color yellow) (whoami) (set_color normal) 

    # Color writeable dirs green, read-only dirs red
    if test -w "."
        printf ' %s%s' (set_color green) (prompt_pwd)
    else
        printf ' %s%s' (set_color red) (prompt_pwd)
    end

    # Git branch
    printf '%s%s' (set_color normal) (__fish_git_prompt) (set_color red)

    switch $USER
        case root
        printf ' # '

        case '*'
        printf ' > '
    end
    printf '%s' (set_color normal)
end