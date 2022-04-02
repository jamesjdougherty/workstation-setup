### Git Config ###

```
[alias]
    amend = commit --amend
    namend = commit --amend --no-edit
    fp = fetch -p
    st = status
    di = diff
    co = checkout
    ci = commit
    br = branch
    sta = stash
    llog = log --date=local
    flog = log --pretty=fuller --decorate
    lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
    lol = log --graph --decorate --oneline
    lola = log --graph --decorate --oneline --all
    blog = log origin/master... --left-right
    ds = diff --staged
    squash = commit --squash
    unstage = reset HEAD
    rum = rebase master@{u}
[pull]
    rebase = false
[user]
    name = First Last
    email = First.Last@email.com
```

