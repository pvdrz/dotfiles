# The most awesome editor in the universe (until I find another one)
set -gx EDITOR nvim
alias vim nvim
alias vi nvim

# for local binaries
set -gx PATH $HOME/.local/bin $PATH

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

# Because wifi sucks
function rwifi
    sudo rwifi
end

# Source cms-config
source $HOME/Workspace/cms-scripts/shell/config.fish
