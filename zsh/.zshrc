export EDITOR=nvim

export GOPATH=$HOME/.go
export PREFIX=$HOME/.yarn_packages
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

path=($PREFIX/bin $HOME/.local/bin $HOME/.cargo/bin $GOPATH/bin $path)

alias nano=nvim
alias vim=nvim

alias irc="ssh weechat_aws -t 'tmux attach-session -t weechat_session'"

check-sync() {
    watch grep -e Dirty: -e Writeback: /proc/meminfo
}
