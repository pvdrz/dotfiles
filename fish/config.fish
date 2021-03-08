# The most awesome editor in the universe (until I find another one)
set -gx EDITOR nvim
alias vim nvim
alias vi nvim

# for local binaries
set -gx PATH $HOME/.local/bin $PATH
# for cargo binaries
set -gx PATH $HOME/.cargo/bin $PATH

# sudoedit is too long
alias svim sudoedit

# Check writing on disk
function check-sync
    watch grep -e Dirty: -e Writeback: /proc/meminfo
end

# Remove greeting
set -gx fish_greeting ""
