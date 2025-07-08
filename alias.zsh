alias c='clear'

# rcpp() {
  # g++ "$1" -o temp_exec && ./temp_exec && rm temp_exec
# }
alias rcp='function _runcpp() { g++-14 -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias rcp20='function _runcpp() { g++-14 -std=c++20 -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias rcp17='function _runcpp() { g++-14 -std=c++17 -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias rcp11='function _runcpp() { g++-14 -std=c++11 -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias compilegl='function _runcpp() { clang -o "${1%.cpp}" "$1"  -I$(brew --prefix)/include -L$(brew --prefix)/lib -lglfw -framework OpenGL }; _runcpp'
alias rgl='function _runcpp() { clang -o main "$1" -I$(brew --prefix)/include -L$(brew --prefix)/lib -lglfw -framework OpenGL && ./main && rm -rf main}; _runcpp'
alias sz='source ~/.zshrc'
alias oo='cd $HOME/Documents/Obsidian\ Vault/'
alias gozsh='nvim ~/.zshrc'
alias cd='z'
alias rt='cd $HOME'
alias gosys='cd $HOME/Systems_tut/'
alias godev='cd $HOME/Developer/'
alias gonvim='cd $HOME/.config/nvim/'
alias arise='conda activate IMC_ENV'
alias ls='eza --icons=always'
# alias run_cpp='g++ "$1" -o temp_exec && ./temp_exec && rm temp_exec'
alias getal='nvim $HOME/ZSH/alias.zsh'
alias conf='gonvim && nvim .'
alias gorst='cd $HOME/Systems_tut/Rust_tut/'
alias gozig='cd $HOME/Systems_tut/Zig_Tut/'
alias getfile='echo "$1"'
alias gopar='cd $HOME/Systems_tut/MultiThreading/'

# Self commands
alias num_core='$HOME/Helper/Exec/get_cores'

# GIT ALIASES -----------------------------------------------------------------
alias gc='git commit'
alias gam='git commit -am'
alias gco='git checkout'
alias ga='git add'
alias gstat='git status'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch -D'
alias gcp='git cherry-pick'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias grs='git restore --staged'
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || exa'
alias gu='git reset --soft HEAD~1'
alias gp='git push origin'
alias gpr='git remote prune origin'
alias ff='gpr && git pull --ff-only'
alias grd='git fetch origin && git rebase origin/master'
alias gbb='git-switchbranch'
alias gbf='git branch | head -1 | xargs' # top branch
# alias gl=pretty_git_log
# alias gla=pretty_git_log_all
alias gl="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(green)%an %ar %C(reset) %C(bold magenta)%d%C(reset)'"
alias gla="git log --all --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(bold magenta)%d%C(reset)'"
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gec='git status | grep "both modified:" | cut -d ":" -f 2 | trim | xargs nvim -'
alias gcan='gc --amend --no-edit'

alias gpxarg="script -q /dev/null git push -u 2>&1 | tee >(cat) | grep \"pull/new\" | awk '{print \$2}' | xargs open"
alias gpf='git push --force-with-lease'

alias gbdd='git-branch-utils -d'
alias gbuu='git-branch-utils -u'
alias gbrr='git-branch-utils -r -b develop'
alias gg='git branch | fzf | xargs git checkout'
alias gup='git branch --set-upstream-to=origin/$(git-current-branch) $(git-current-branch)'

alias gnext='git log --ancestry-path --format=%H ${commit}..master | tail -1 | xargs git checkout'
alias gprev='git checkout HEAD^'

# FUNCTIONS -------------------------------------------------------------------
# function gg {
#     git branch | grep "$1" | head -1 | xargs git checkout
# }

