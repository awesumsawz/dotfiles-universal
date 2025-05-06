# --- Begin custom functions for argument-taking git aliases ---
def gbg [] { LANG=C git branch -vv | grep ': gone]' }
def gbgD [] { LANG=C git branch --no-color -vv | grep ': gone]' | cut -c 3- | awk '{print $1}' | xargs git branch -D }
def gbgd [] { LANG=C git branch --no-color -vv | grep ': gone]' | cut -c 3- | awk '{print $1}' | xargs git branch -d }
def gdct [] { git describe --tags (git rev-list --tags --max-count=1 | str trim) }
def gfg [pattern] { git ls-files | grep $pattern }
def ggpull [] { git pull origin (git_current_branch | str trim) }
def ggpush [] { git push origin (git_current_branch | str trim) }
def ggsup [] { git branch --set-upstream-to=origin/(git_current_branch | str trim) }
def gignored [] { git ls-files -v | grep '^[[:lower:]]' }
def gk [] { gitk --all --branches }
def gke [] { gitk --all (git log --walk-reflogs --pretty=%h | str trim) }
def gluc [] { git pull upstream (git_current_branch | str trim) }
def glum [] { git pull upstream (git_main_branch | str trim) }
def gmom [] { git merge origin/(git_main_branch | str trim) }
def gmum [] { git merge upstream/(git_main_branch | str trim) }
def gpoat [] { git push origin --all; git push origin --tags }
def gpristine [] { git reset --hard; git clean --force -dfx }
def gprom [] { git pull --rebase origin (git_main_branch | str trim) }
def gpromi [] { git pull --rebase=interactive origin (git_main_branch | str trim) }
def gprum [] { git pull --rebase upstream (git_main_branch | str trim) }
def gprumi [] { git pull --rebase=interactive upstream (git_main_branch | str trim) }
def gpsup [] { git push --set-upstream origin (git_current_branch | str trim) }
def gpsupf [] { git push --set-upstream origin (git_current_branch | str trim) --force-with-lease --force-if-includes }
def grbom [] { git rebase origin/(git_main_branch | str trim) }
def grbum [] { git rebase upstream/(git_main_branch | str trim) }
def groh [] { git reset origin/(git_current_branch | str trim) --hard }
def grt [] { cd (git rev-parse --show-toplevel | str trim) }
def gtv [] { git tag | lines | sort }
def gunwip [] { if (git rev-list --max-count=1 --format='%s' HEAD | str contains '--wip--') { git reset HEAD~1 } }
def gwip [] { git add -A; git rm (git ls-files --deleted | str trim); git commit --no-verify --no-gpg-sign --message '--wip-- [skip ci]' }
def gwipe [] { git reset --hard; git clean --force -df }
def git_svn_dcommit_push [] { git svn dcommit; git push github $"{(git_main_branch | str trim)}:svntrunk" }
def gtl [pattern="*"] { git tag --sort=-v:refname -n --list $"{pattern}" }
# --- End custom functions ---

# Simple aliases
alias g = git
alias ga = git add
alias gaa = git add --all
alias gam = git am
alias gama = git am --abort
alias gamc = git am --continue
alias gams = git am --skip
alias gamscp = git am --show-current-patch
alias gap = git apply
alias gapa = git add --patch
alias gapt = git apply --3way
alias gau = git add --update
alias gav = git add --verbose
alias gb = git branch
alias gbD = git branch --delete --force
alias gba = git branch --all
alias gbd = git branch --delete
alias gbl = git blame -w
alias gbm = git branch --move
alias gbnm = git branch --no-merged
alias gbr = git branch --remote
alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsn = git bisect new
alias gbso = git bisect old
alias gbsr = git bisect reset
alias gbss = git bisect start
alias gc = git commit --verbose
alias 'gc!' = git commit --verbose --amend
alias gcB = git checkout -B
alias gca = git commit --verbose --all
alias 'gca!' = git commit --verbose --all --amend
alias gcam = git commit --all --message
alias 'gcan!' = git commit --verbose --all --no-edit --amend
alias 'gcann!' = git commit --verbose --all --date=now --no-edit --amend
alias 'gcans!' = git commit --verbose --all --signoff --no-edit --amend
alias gcas = git commit --all --signoff
alias gcasm = git commit --all --signoff --message
alias gcb = git checkout -b
alias gcd = git checkout (git_develop_branch)
alias gcf = git config --list
alias gcl = git clone --recurse-submodules
alias gclean = git clean --interactive -d
alias gclf = git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules
alias gcm = git checkout (git_main_branch)
alias gcmsg = git commit --message
alias gcn = git commit --verbose --no-edit
alias 'gcn!' = git commit --verbose --no-edit --amend
alias gco = git checkout
alias gcor = git checkout --recurse-submodules
alias gcount = git shortlog --summary --numbered
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
alias gcs = git commit --gpg-sign
alias gcsm = git commit --signoff --message
alias gcss = git commit --gpg-sign --signoff
alias gcssm = git commit --gpg-sign --signoff --message
alias gd = git diff
alias gdca = git diff --cached
alias gdcw = git diff --cached --word-diff
alias gds = git diff --staged
alias gdt = git diff-tree --no-commit-id --name-only -r
alias gdup = git diff @{upstream}
alias gdw = git diff --word-diff
alias gf = git fetch
alias gfa = git fetch --all --tags --prune --jobs=10
alias gfo = git fetch origin
alias gg = git gui citool
alias gga = git gui citool --amend
alias ghh = git help
alias gignore = git update-index --assume-unchanged
alias gl = git pull
alias glg = git log --stat
alias glgg = git log --graph
alias glgga = git log --graph --decorate --all
alias glgm = git log --graph --max-count=10
alias glgp = git log --stat --patch
alias glo = git log --oneline --decorate
alias glod = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"
alias glods = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
alias glol = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"
alias glola = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all
alias glols = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat
alias gm = git merge
alias gma = git merge --abort
alias gmc = git merge --continue
alias gmff = git merge --ff-only
alias gms = git merge --squash
alias gmtl = git mergetool --no-prompt
alias gmtlvim = git mergetool --no-prompt --tool=vimdiff
alias gp = git push
alias gpd = git push --dry-run
alias gpf = git push --force-with-lease --force-if-includes
alias 'gpf!' = git push --force
alias gpod = git push origin --delete
alias gpr = git pull --rebase
alias gpra = git pull --rebase --autostash
alias gprav = git pull --rebase --autostash -v
alias gprv = git pull --rebase -v
alias gpu = git push upstream
alias gpv = git push --verbose
alias gr = git remote
alias gra = git remote add
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbd = git rebase (git_develop_branch)
alias grbi = git rebase --interactive
alias grbm = git rebase (git_main_branch)
alias grbo = git rebase --onto
alias grbs = git rebase --skip
alias grev = git revert
alias greva = git revert --abort
alias grevc = git revert --continue
alias grf = git reflog
alias grh = git reset
alias grhh = git reset --hard
alias grhk = git reset --keep
alias grhs = git rm --cached
alias grmv = git remote rename
alias grrm = git remote remove
alias grs = git restore
alias grset = git remote set-url
alias grss = git restore --source
alias grst = git restore --staged
alias gru = git reset --
alias grup = git remote update
alias grv = git remote --verbose
alias gsb = git status --short --branch
alias gsd = git svn dcommit
alias gsh = git show
alias gsi = git submodule init
alias gsps = git show --pretty=short --show-signature
alias gsr = git svn rebase
alias gss = git status --short
alias gst = git status
alias gsta = git stash push
alias gstaa = git stash apply
alias gstall = git stash --all
alias gstc = git stash clear
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gsts = git stash show --patch
alias gsu = git submodule update
alias gsw = git switch
alias gswc = git switch --create
alias gswd = git switch (git_develop_branch)
alias gswm = git switch (git_main_branch)
alias gta = git tag --annotate
alias gts = git tag --sign
alias gunignore = git update-index --no-assume-unchanged
alias gwch = git whatchanged -p --abbrev-commit --pretty=medium
alias gwt = git worktree
alias gwta = git worktree add
alias gwtls = git worktree list
alias gwtmv = git worktree move
alias gwtrm = git worktree remove