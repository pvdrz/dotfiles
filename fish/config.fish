set -gx EDITOR "nvim"

set -gx GOPATH $HOME/.go
set -gx PREFIX $HOME/.yarn_packages
set -gx RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

set -gx PATH $PREFIX/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $GOPATH/bin $PATH

alias nano "nvim"
alias vim "nvim"

function check-sync
    watch grep -e Dirty: -e Writeback: /proc/meminfo
end

function grability
    /home/christian/Workspace/rappi/utils/run.py $argv
end

tabs 4
