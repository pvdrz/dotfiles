# The most awesome editor in the universe (until I find another one)
set -gx EDITOR nvim
alias vim nvim
alias vi nvim

# Path
set -gx GOPATH $HOME/.go
set -gx PREFIX $HOME/.yarn_packages

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $PREFIX/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.exercism/ $PATH

# for tmux + nvim colors
set -gx TERM xterm-256color

# for cargo-miri
set -gx MIRI_SYSROOT $HOME/.xargo/HOST

# ripgrep instead of grep
alias grep rg

# fd instead of find
alias find fd

# Check writing on disk
function check-sync
    watch grep -e Dirty: -e Writeback: /proc/meminfo
end

# Sync git forks
function sync-fork
    git fetch upstream
    git checkout master
    git merge upstream/master
    git push
end

# Remove greeting
set -gx fish_greeting ""
