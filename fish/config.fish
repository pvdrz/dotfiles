# The most awesome editor in the universe (until I find another one)
set -gx EDITOR nvim
alias vim nvim
alias vi nvim

# for local binaries
set -gx PATH $HOME/.local/bin $PATH
# for cargo binaries
set -gx PATH $HOME/.cargo/bin $PATH

set -gx GOPATH $HOME/Workspace/go
set -gx PATH $GOPATH/bin $PATH

# sudoedit is too long
alias svim sudoedit

# Check writing on disk
function check-sync
    watch grep -e Dirty: -e Writeback: /proc/meminfo
end

# Remove greeting
set -gx fish_greeting ""

# Print and run command
function print_and_run
    echo Running "`$argv`"...
    $argv
end

# Check that crate is perfect
function corgi
    print_and_run cargo +nightly fmt --all &&
    print_and_run cargo check --all-targets --all-features &&
    print_and_run cargo clippy --all-targets --all-features &&
    print_and_run cargo test --all-features &&
    print_and_run cargo +nightly test --all-features &&
    print_and_run cargo doc --all-features
end
