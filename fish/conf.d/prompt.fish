function fish_prompt
    set -l prompt_symbol ' > '
    fish_is_root_user; and set prompt_symbol '#'
    
    # set -l hn ''
    # if hostname != 'Macbook-home-ns.local'
    #     set hn hostname
    # end

    echo -s (set_color blue) (prompt_pwd) \
    (set_color yellow) (fish_git_prompt) $prompt_symbol (set_color normal)
end
