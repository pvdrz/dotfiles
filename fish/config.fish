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

# Check if crates are perfect
function corgi
    function print_and_run
        echo Running "`$argv`"...
        eval $argv
    end

    set cmds "cargo +nightly fmt --all"
    set cmds $cmds "cargo check --release --all-targets --all-features"
    set cmds $cmds "cargo clippy --all-targets --all-features"
    set cmds $cmds "cargo test --release --all-features"
    set cmds $cmds "cargo doc --all-features"

    set args
    if test -n "$argv"
        for arg in $argv
            set args $args " -p $arg"
        end
    else
        set args $args ""
    end

    for cmd in $cmds
        for arg in $args
            print_and_run "$cmd$arg"
        end
    end
end
