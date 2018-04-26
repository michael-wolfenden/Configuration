function pull() {
    $branchName = & git symbolic-ref --short -q HEAD

    if ($?) {
        & git pull origin $currentBranch --rebase --prune
    } else {
        write-host "not on any branch" -ForegroundColor Red
    }
}

function update() {
    $branchName = & git symbolic-ref --short -q HEAD

    if ($?) {
        & git checkout master
        pull
        & git checkout $branchName
        & git rebase master
    } else {
        write-host "not on any branch" -ForegroundColor Red
    }
}

function update-dirty() {
    & git stash
    update
    & git stash pop
}

function work-start {
    [CmdletBinding()]
    param(
        [Parameter(Position=0,mandatory)]
        [string] $branchName
    )
    process {
        & git checkout master
        pull
        & git checkout -b $branchName
    }
}

function work-done {
    [CmdletBinding()]
    param(
        [Parameter(Position=0,mandatory)]
        [string] $branchName
    )
    process {
        & git checkout master
        pull
        & git branch -D $branchName
        & git push origin --delete $branchName
    }
}

function rebase {
    [CmdletBinding()]
    param(
        [Parameter(Position=0,mandatory)]
        [int] $n
    )
    process {
        & git rebase -i HEAD~$n
    }
}

function fpush {
    [CmdletBinding()]
    param(
        [Parameter(Position=0,mandatory)]
        [string] $branchName
    )
    process {
        if ($branchName == "master") {
            write-host "cannot force push to master" -ForegroundColor Red
        } else {
            & git push --force-with-lease origin $branchName
        }
    }
}

function push {
    [CmdletBinding()]
    param(
        [Parameter(Position=0,mandatory)]
        [string] $branchName
    )
    process {
        & git push origin $branchName
    }
}

function log {
    & git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short
}

function status {
    & git status
}

function commit {
    [CmdletBinding()]
    param(
        [Parameter(Position=0,mandatory)]
        [string] $message
    )
    process {
        & git add -A
        & git commit -m $message
    }
}

function update-fork {
    & git checkout master
    & git fetch upstream master
    & git merge upstream/master
    & push master
}

function wipe {
    commit wipe
    & git reset HEAD~1 --hard
}