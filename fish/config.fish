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

 set fish_color_normal cdd6f4
 set fish_color_command 89b4fa
 set fish_color_param f2cdcd
 set fish_color_keyword f38ba8
 set fish_color_quote a6e3a1
 set fish_color_redirection f5c2e7
 set fish_color_end fab387
 set fish_color_comment 7f849c
 set fish_color_error f38ba8
 set fish_color_gray 6c7086
 set fish_color_selection --background=313244
 set fish_color_search_match --background=313244
 set fish_color_option a6e3a1
 set fish_color_operator f5c2e7
 set fish_color_escape eba0ac
 set fish_color_autosuggestion 6c7086
 set fish_color_cancel f38ba8
 set fish_color_cwd f9e2af
 set fish_color_user 94e2d5
 set fish_color_host 89b4fa
 set fish_color_host_remote a6e3a1
 set fish_color_status f38ba8
 set fish_pager_color_progress 6c7086
 set fish_pager_color_prefix f5c2e7
 set fish_pager_color_completion cdd6f4
 set fish_pager_color_description 6c7086
