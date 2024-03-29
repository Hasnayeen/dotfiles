alias g = git

alias ga = git add
alias gaa = git add --all
# alias gapa = git add --patch
# alias gau = git add --update
# alias gav = git add --verbose
# alias gap = git apply
# alias gapt = git apply --3way

alias gb = git branch
# alias gba = git branch -a
alias gbd = git branch -d
alias gbD = git branch -D
# alias gbl = git blame -b -w
# alias gbnm = git branch --no-merged
# alias gbr = git branch --remote
# alias gbs = git bisect
# alias gbsb = git bisect bad
# alias gbsg = git bisect good
# alias gbsr = git bisect reset
# alias gbss = git bisect start

alias gc = git commit -v
alias gc! = git commit -v --amend
alias gcn! = git commit -v --no-edit --amend
alias gca = git commit -v -a
alias gca! = git commit -v -a --amend
alias gcan! = git commit -v -a --no-edit --amend
alias gcans! = git commit -v -a -s --no-edit --amend
alias gcam = git commit -a -m
alias gcsm = git commit -s -m
alias gcas = git commit -a -s
alias gcasm = git commit -a -s -m
alias gcb = git checkout -b
alias gcf = git config --list
alias gcl = git clone --recurse-submodules
alias gclean = git clean -id
alias gpristine = git reset --hard and git clean -dffx
# alias gcm = git checkout $(git_main_branch)
# alias gcd = git checkout $(git_develop_branch)
alias gcmsg = git commit -m
alias gco = git checkout
alias gcor = git checkout --recurse-submodules
alias gcount = git shortlog -sn
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
alias gcs = git commit -S
alias gcss = git commit -S -s
alias gcssm = git commit -S -s -m

alias gd = git diff
alias gdca = git diff --cached
alias gdcw = git diff --cached --word-diff
# alias gdct = git describe --tags $(git rev-list --tags --max-count=1)
alias gds = git diff --staged
alias gdt = git diff-tree --no-commit-id --name-only -r
alias gdup = git diff @{upstream}
alias gdw = git diff --word-diff

alias ggpur = ggu
alias ggpull = git pull origin (git branch --show-current)
alias ggpush = git push origin (git branch --show-current)

# alias ggsup = git branch --set-upstream-to=origin/$(git_current_branch)
# alias gpsup = git push --set-upstream origin $(git_current_branch)

alias ghh = git help

alias gignore = git update-index --assume-unchanged
# alias gignored = (git ls-files -v | grep "^[[:lower:]]")

alias gk = \gitk --all --branches &!
# alias gke = \gitk --all $(git log -g --pretty=%h) &!

alias gl = git pull
alias glg = git log --stat
alias glgp = git log --stat -p
alias glgg = git log --graph
alias glgga = git log --graph --decorate --all
alias glgm = git log --graph --max-count=10
alias glo = git log --oneline --decorate
# alias glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
# alias glols = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
# alias glod = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
# alias glods = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
# alias glola = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
# alias glp = "_git_log_prettily"

alias gm = git merge
# alias gmom = git merge origin/$(git_main_branch)
alias gmtl = git mergetool --no-prompt
alias gmtlvim = git mergetool --no-prompt --tool=vimdiff
# alias gmum = git merge upstream/$(git_main_branch)
alias gma = git merge --abort

alias gp = git push
alias gpd = git push --dry-run
alias gpf = git push --force-with-lease
alias gpoat = git push origin --all and git push origin --tags
alias gpr = git pull --rebase
alias gpu = git push upstream
alias gpv = git push -v

alias gr = git remote
alias gra = git remote add
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
# alias grbd = git rebase $(git_develop_branch)
alias grbi = git rebase -i
# alias grbm = git rebase $(git_main_branch)
# alias grbom = git rebase origin/$(git_main_branch)
alias grbo = git rebase --onto
alias grbs = git rebase --skip
alias grev = git revert
alias grh = git reset
alias grhh = git reset --hard
# alias groh = git reset origin/$(git_current_branch) --hard
alias grm = git rm
alias grmc = git rm --cached
alias grmv = git remote rename
alias grrm = git remote remove
alias grs = git restore
alias grset = git remote set-url
alias grss = git restore --source
alias grst = git restore --staged
alias grt = cd "$(git rev-parse --show-toplevel || echo .)"
alias gru = git reset --
alias grup = git remote update
alias grv = git remote -v

alias gsb = git status -sb
alias gsd = git svn dcommit
alias gsh = git show
alias gsi = git submodule init
alias gsps = git show --pretty=short --show-signature
alias gsr = git svn rebase
alias gss = git status -s
alias gst = git status
