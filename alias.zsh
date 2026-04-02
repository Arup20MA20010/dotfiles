alias c='clear'

# rcpp() {
  # g++ "$1" -o temp_exec && ./temp_exec && rm temp_exec
# }
alias dc='ssh dc1'
alias rcp='function _runcpp() { g++ -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias rcp20='function _runcpp() { g++ -std=c++20 -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias rcp23='function _runcpp() { g++ -std=c++23 -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias rcp17='function _runcpp() { g++ -std=c++17 -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias rcp11='function _runcpp() { g++ -std=c++11 -o "${1%.cpp}" "$1" && ./"${1%.cpp}" && rm -rf "${1%.cpp}"; }; _runcpp'
alias compilegl='function _runcpp() { clang -o "${1%.cpp}" "$1"  -I$(brew --prefix)/include -L$(brew --prefix)/lib -lglfw -framework OpenGL }; _runcpp'
alias rgl='function _runcpp() { clang -o main "$1" -I$(brew --prefix)/include -L$(brew --prefix)/lib -lglfw -framework OpenGL && ./main && rm -rf main}; _runcpp'
alias sz='source ~/.zshrc'
alias gozsh='nvim ~/.zshrc'
alias cd='z'
alias rt='cd $HOME'
alias gosys='cd $HOME/Systems_tut/'
alias godev='cd $HOME/Developer/'
alias gonvim='cd $HOME/.config/nvim/'
alias arise='conda activate IMC_ENV'
alias ls='eza --icons=always'
alias big='du -sh $HOME/Work/'
alias log_size='du -sh $HOME/Work/proj_logs/'
alias szflas='du -sh $HOME/Work/flash_repo/'
# alias run_cpp='g++ "$1" -o temp_exec && ./temp_exec && rm temp_exec'
alias getal='nvim $HOME/ZSH/alias.zsh'
alias conf='gonvim && nvim .'
alias gorst='cd $HOME/Systems_tut/Rust_tut/'
alias gozig='cd $HOME/Systems_tut/Zig_Tut/'
alias getfile='echo "$1"'
alias gopar='cd $HOME/Systems_tut/MultiThreading/'
alias y='yazi'

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
alias gwl='git worktree list'
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
alias gsui='git submodule update --init'
alias gsu='git submodule update'
alias gbdd='git-branch-utils -d'
alias gbuu='git-branch-utils -u'
alias gbrr='git-branch-utils -r -b develop'
alias gg='git branch | fzf | xargs git checkout'
alias gup='git branch --set-upstream-to=origin/$(git-current-branch) $(git-current-branch)'

alias gnext='git log --ancestry-path --format=%H ${commit}..master | tail -1 | xargs git checkout'
alias gprev='git checkout HEAD^'

alias gsuic='function _gsuic() { echo "$1"; git submodule update --init alphas/common/"$1" alphas/common/"$1"; }; _gsuic'
alias gsuit='function _gsuit() {echo "$1"; git submodule update --init alphas/tech/"$1" alphas/tech/"$1";};_gsuit'
alias gsuiu='function _gsuiu() {echo "$1"; git submodule update --init utils/"$1" utils/"$1";};_gsuiu'
alias gsdc='function _gsdc() {echo "$1"; git submodule deinit alphas/common/"$1";};_gsdc'
# FUNCTIONS -------------------------------------------------------------------
# Function to run 'git submodule update' only on initialized submodules.
# It filters out submodules marked with '-' from 'git submodule status'.
gsu_update() {
    # Check if we are in a Git repository
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "ERROR: Not inside a Git working tree." >&2
        return 1
    fi

    echo "--- Checking and updating initialized submodules... 🔄"

    # Core logic: filter status for initialized modules (not starting with '-') and extract path
    git submodule status --recursive | \
    grep -v "^\-" | \
    awk '{print $2}' | \
    while read -r SUBMODULE_PATH; do
        if [ -n "$SUBMODULE_PATH" ]; then
            echo "✅ Updating: $SUBMODULE_PATH"
            # Run the update command only on the specific, initialized path
            git submodule update "$SUBMODULE_PATH"
        fi
    done

    echo "--- Submodule update complete. ✨"
}
# function gg {
#     git branch | grep "$1" | head -1 | xargs git checkout
# }
# gwtb <existing-branch-name>
gwtb() {
  local branch_name="$1"
  local worktree_path="$HOME/Work/HotFixes/$branch_name"
  # Check if a branch name was provided
  if [ -z "$branch_name" ]; then
    echo "Usage: gwtb <existing-branch-name>"
    return 1
  fi
  echo "Creating worktree for existing branch '$branch_name' at '$worktree_path'"
  git worktree add "$worktree_path" "$branch_name"
}
# gwtnb <new-branch-name> [base-branch]
gwtnb() {
  local new_branch="$1"
  local base_branch="${2:-HEAD}" # Defaults to current HEAD if no base branch is given
  local worktree_path="$HOME/Work/HotFixes/$new_branch"

  # Check if a new branch name was provided
  if [ -z "$new_branch" ]; then
    echo "Usage: gwtnb <new-branch-name> [base-branch]"
    return 1
  fi

  echo "Creating new branch '$new_branch' based on '$base_branch' and checking out at '$worktree_path'"
  git worktree add -b "$new_branch" "$worktree_path" "$base_branch"
}



# Define a function to navigate to a specific hotfix 
gofix() {
  local branch_name="$1"
  local commit_hash="$2"
  local worktree_dir="$HOME/Work/HotFixes/$branch_name"
  local branch_exists=false

  # 1. Input Validation
  if [ -z "$branch_name" ]; then
    echo "Usage: gofix <branch-name> [commit-hash]"
    return 1
  fi
  
  # Check if the branch name already exists locally
  if git show-ref --quiet --verify "refs/heads/$branch_name"; then
    branch_exists=true
  fi

  # 2. Check for Existing Worktree Directory
  if [ -d "$worktree_dir" ]; then
    echo "✅ Worktree already exists for '$branch_name'. Navigating..."
  
  # 3. Create Worktree if it doesn't exist
  else
    echo "Worktree not found for '$branch_name'."
    
    # A. Case: Branch exists (already has the commit or not)
    if $branch_exists; then
      echo "Branch '$branch_name' exists locally. Checking it out..."
      # Create worktree using the existing branch
      git worktree add "$worktree_dir" "$branch_name"
    
    # B. Case: Branch does NOT exist, but a commit hash IS provided
    elif [ -n "$commit_hash" ]; then
      echo "Branch '$branch_name' does not exist. Creating new branch from commit $commit_hash..."
      # Create the new branch and worktree, starting from the commit hash
      git worktree add -b "$branch_name" "$worktree_dir" "$commit_hash"
    
    # C. Case: Branch does NOT exist and NO commit hash is provided (Default to HEAD)
    else
      echo "Branch '$branch_name' does not exist. Creating new branch from current HEAD..."
      # Create the new branch and worktree, starting from the current branch's HEAD
      # (You can optionally change 'HEAD' to 'main' or another base branch if preferred)
      git worktree add -b "$branch_name" "$worktree_dir" HEAD
    fi
  fi
  
  # 4. Final step: Navigate
  # Check if the worktree directory was successfully created before navigating
  if [ -d "$worktree_dir" ]; then
    cd "$worktree_dir"
    git submodule update --init .gitconfig
  else
    echo "❌ Failed to create or find worktree directory: $worktree_dir"
    return 1
  fi
}

fixdone() {
  local branch_name="$1"
  local worktree_dir="$HOME/Work/HotFixes/$branch_name"
  local main_repo_path="$HOME/Work/flash"

  # ... (Input validation and cd out of the worktree remain the same) ...

  # 3. SAFETY CHECK: Check if the worktree is clean (including submodules)
  # This command checks the state of the worktree, which includes submodules.
  if [[ -n $(git -C "$worktree_dir" status --porcelain --ignore-submodules=none) ]]; then
    echo "❌ ABORTING: Worktree '$branch_name' has uncommitted changes in the main project OR submodules."
    echo "Please go to '$worktree_dir' and run 'git status'."
    echo "Commit, stash, or reset the changes manually before running 'fixdone $branch_name' again."
    return 1
  fi
  
  # 4. If clean, proceed with safe removal (it will still require --force if the submodule is INITIALIZED)
  echo "Worktree is clean. Removing worktree for '$branch_name'..."
  
  # We still use --force here because Git treats INITIALIZED submodules as "unclean" even if no changes exist
  if git worktree remove --force "$worktree_dir"; then
    echo "✅ Worktree directory removed successfully."
  else
    echo "❌ Error: Worktree removal failed."
    return 1
  fi

  # 5. Prune the repository for cleanup
  echo "Pruning administrative files..."
  git worktree prune
  echo "✅ Cleanup complete."
}
