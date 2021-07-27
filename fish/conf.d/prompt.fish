function fish_prompt
    set -l prompt_symbol ' > '
    fish_is_root_user; and set prompt_symbol '#'

    echo -s (set_color blue) (prompt_pwd) \
    (set_color yellow) (fish_git_prompt) $prompt_symbol (set_color normal)
end
