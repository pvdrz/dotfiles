# The most awesome editor in the universe (until I find another one)
set -gx EDITOR nvim
alias vim nvim
alias vi nvim

# Path
set -gx GOPATH $HOME/.go
set -gx PREFIX $HOME/.yarn_packages
set -gx RUST_SRC_PATH $HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $PREFIX/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH



# Ripgrep instead of grep
alias grep rg

# IRC amazon instance
alias irc "ssh irc_aws -t 'tmux attach-session -t irc_session'"

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
