# The most awesome editor in the universe (until I find another one)
set -gx EDITOR nvim
alias vim nvim
alias vi nvim

# for tmux + nvim colors
set -gx TERM xterm-256color

# for cargo-miri
set -gx MIRI_SYSROOT $HOME/.xargo/HOST

# ripgrep instead of grep
alias grep rg

# fd instead of find
alias find fd

# sudoedit is too long
alias svim sudoedit

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
