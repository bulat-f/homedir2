if [[ -x `which git 2> /dev/null` ]]; then
    
    function in_mnt_dir() {
        pwd | grep '/home/bulat/mnt'
    }

    function git-branch-name () {
        git branch 2> /dev/null | grep '^\*' | sed 's/^\*\ //'
    }

    function git-prompt() {
        if [[ x$ngp = x ]]; then
            in_mnt_dir=$(in_mnt_dir)
            if [[ x$in_mnt_dir = x ]]; then
                branch=$(git-branch-name)
                if [[ x$branch != x ]]; then
                    color=$fg[cyan]
                    wc_status=""
                    
                    gstatus=$(git status 2> /dev/null)
                    
                    dirty=$(echo $gstatus | sed 's/^#.*$//' | tail -2 | grep 'working directory clean';)
                    if [[ x$dirty = x ]]; then
                        color=$fg[magenta]
                    fi

                    need_push=$(echo $gstatus | grep 'Your branch is ahead' 2> /dev/null)
                    if [[ x$need_push != x ]]; then
                        wc_status=" F"
                    fi

                    need_pull=$(echo $gstatus | grep 'Your branch is behind' 2> /dev/null) 
                    if [[ x$need_pull != x ]]; then
                        wc_status=" B"
                    fi
                    
                    diverged=$(echo $gstatus | grep 'have diverged,' 2> /dev/null) 
                    if [[ x$diverged != x ]]; then
                        wc_status=" D"
                        color=$fg[red]
                    fi

                    echo " %{$color%}$branch$wc_status%{$reset_color%} "
                fi
            fi
        else
            echo ''    
        fi
    }

    function git-prompt-off() {
        ngp='TRUE'
    }

    function git-prompt-on() {
        ngp=''
    }

    function git-scoreboard () {
        git log | grep Author | sort | uniq -ci | sort -r
    }
    function git-track () {
        branch=$(git-branch-name)
        git config branch.$branch.remote origin
        git config branch.$branch.merge refs/heads/$branch
        echo "tracking origin/$tracking"
    }
    function github-init () {
        git config branch.$(git-branch-name).remote origin
        git config branch.$(git-branch-name).merge refs/heads/$(git-branch-name)
    }
    
fi

alias pbe='env RAILS_ENV=production bundle exec'
alias pdb='pbe rails db'
alias pc='pbe rails c'
