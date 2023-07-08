# The most awesome editor in the universe (until I find another one)
set -gx EDITOR nvim
alias vim nvim
alias vi nvim

# for local binaries
set -gx PATH $HOME/.local/bin $PATH
# for cargo binaries
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH /usr/lib/rustup/bin/ $PATH
set -gx SCCACHE_CACHE_SIZE "30G"

set -gx GOPATH $HOME/Workspace/go
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $HOME/.nix-profile/bin $PATH

set -gx DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock

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
            if test $status -ne 0
                return -1
            end
        end
    end
end

set nord0 2e3440
set nord1 3b4252
set nord2 434c5e
set nord3 4c566a
set nord4 d8dee9
set nord5 e5e9f0
set nord6 eceff4
set nord7 8fbcbb
set nord8 88c0d0
set nord9 81a1c1
set nord10 5e81ac
set nord11 bf616a
set nord12 d08770
set nord13 ebcb8b
set nord14 a3be8c
set nord15 b48ead

set fish_color_normal $nord4
set fish_color_command $nord9
set fish_color_quote $nord14
set fish_color_redirection $nord9
set fish_color_end $nord6
set fish_color_error $nord11
set fish_color_param $nord4
set fish_color_comment $nord3
set fish_color_match $nord8
set fish_color_search_match $nord8
set fish_color_operator $nord9
set fish_color_escape $nord13
set fish_color_cwd $nord8
set fish_color_autosuggestion $nord6
set fish_color_user $nord4
set fish_color_host $nord9
set fish_color_cancel $nord15
set fish_pager_color_prefix $nord13
set fish_pager_color_completion $nord6
set fish_pager_color_description $nord10
set fish_pager_color_progress $nord12
set fish_pager_color_secondary $nord1

test -r "~/.dir_colors" && eval (dircolors -c ~/.dircolors)
