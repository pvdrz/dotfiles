export EDITOR=nvim

export GOPATH=$HOME/.go
export PREFIX=$HOME/.yarn_packages
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

path=($PREFIX/bin $HOME/.local/bin $HOME/.cargo/bin $GOPATH/bin $path)

alias nano=nvim
alias vim=nvim

alias irc="ssh weechat_aws -t 'tmux attach-session -t weechat_session'"

alias grep=rg

check-sync() {
    watch grep -e Dirty: -e Writeback: /proc/meminfo
}

sync-fork() {
    git fetch upstream
    git checkout master
    git merge upstream/master
    git push
}

. /etc/profile.d/vte.sh

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
    . ~/.config/exercism/exercism_completion.zsh
fi