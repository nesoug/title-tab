function git_branch {
  BRANCH_REFS=$(git symbolic-ref HEAD 2>/dev/null) || return
  GIT_BRANCH="${BRANCH_REFS#refs/heads/}"
  [ -n "$GIT_BRANCH" ] && echo "($GIT_BRANCH)"
}

function precmd {
  echo -ne "\e]1;$USER@$(hostname -s): ${PWD/#$HOME/~} $(git_branch)\a"
}
