source $HOME/.config/nvim/deps.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/misc.vim
source $HOME/.config/nvim/look.vim

for file in split(globpath("$HOME/.config/nvim/plugins/", "*"), "\n")
    exe "source" file
endfor
