# The most awesome editor in the universe (until I find another one)
set -gx EDITOR nvim
alias vim nvim
alias vi nvim

# for local binaries
set -gx PATH $HOME/.local/bin $PATH
# for cargo binaries
set -gx PATH $HOME/.cargo/bin $PATH
# for haskell binaries
set -gx GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin $PATH

set -gx TERM xterm-kitty

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

# Dank task wrapper (done by zombiefungus)
function tw --wraps=task
    set modifiers 'mod' 'modify' 'del' 'delete' 'done' 'start' 'stop' 'ann' 'annotate' 'append' 'denotate' 'duplicate' 'edit'
    set others 'add' 'undo'
    if contains $argv[1] $others; or contains $argv[2] $modifiers;
        task $argv rc._forcecolor=on 2>&1 | tee /tmp/taskcout
        clear; task; cat /tmp/taskcout | grep -v forcecolor
    else
        clear; task $argv
    end
end

# Install rustup toolchain
function toolchain-install
    rustup-toolchain-install-master -f (cat ./rust-version) -c rust-src rustc-dev -n $argv[1]
end

# Update rustup toolchain
function toolchain-update
    set name $argv[1]
    set old_hash (rustup run $name rustc --version --verbose | rg "commit-hash: (.{40})" -r '$1')

    if test -z $old_hash
        echo "toolchain $name not found" 1>&2
        return 1
    end

    set new_hash (cat ./rust-version)

    if test $old_hash != $new_hash
        rustup-toolchain-install-master -f $new_hash -c rust-src rustc-dev -n $name
    else
        echo "toolchain $name is up to date"
    end
end

function killpci
    sudo modprobe -r ath10k_pci
    sudo modprobe -r ath10k_core
    sudo modprobe -r ath
end
