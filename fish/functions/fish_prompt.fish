# Defined interactively
function fish_prompt --description 'Write out the prompt'
    echo -n -s (set_color $fish_color_param) (prompt_pwd) (set_color $fish_color_cwd) (fish_vcs_prompt) (set_color normal) ' $ '
end
