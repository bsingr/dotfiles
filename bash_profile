source $HOME/.bashrc
source $HOME/.aliases

# determined using (the slowish): brew --prefix
if [ -f $BREW_PATH/etc/bash_completion ]; then
  . $BREW_PATH/etc/bash_completion
fi

# development
export CDPATH="$CDPATH:$HOME/Development"

export EDITOR=atom
export PAGER=less
export BROWSER=chromium

which docker-machine && eval "$(docker-machine env dev)"

# history
HISTSIZE=1000000
HISTIGNORE='ls:bg:fg:history'

# load direnv
eval "$(direnv hook $0)"

# chruby
source $BREW_PATH/share/chruby/chruby.sh
source $BREW_PATH/share/chruby/auto.sh

# nvm
export NVM_DIR=~/.nvm
# determined using (the slowish): brew --prefix nvm
#source $BREW_PATH/opt/nvm/nvm.sh

# Set GREP highlight color to red
export GREP_COLOR='1;31'

# Fuzzy
export FZF_DEFAULT_COMMAND="find * -path '*/\\.*' -prune -o -path '*\/node_modules\/*' -prune -o -type f -print -o -type l -print 2> /dev/null"
export FZF_DEFAULT_OPTS="--sort 1000000000"

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# fd - cd to selected directory
fdd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - repeat history
fh() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

# The various escape codes that we can use to color our prompt.
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       CYAN="\[\033[0;36m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

function is_git_repository {
  git branch > /dev/null 2>&1
}

function parse_git_branch {
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        git_status="$(git status 2> /dev/null)"
        branch_pattern="^# On branch ([^${IFS}]*)"
        detached_branch_pattern="# Not currently on any branch"
        remote_pattern="# Your branch is (.*) '"
        diverge_pattern="# Your branch and (.*) have diverged"
        untracked_pattern="# Untracked files:"
        staged_pattern="Changes to be committed"
        not_staged_pattern="Changes not staged for commit"

        #files not staged for commit
        if [[ ${git_status}} =~ ${not_staged_pattern} ]]; then
            state="${RED}"
        #staged files
        elif [[ ${git_status} =~ ${staged_pattern} ]]; then
            state="${BLUE}"
        #untracked files
        elif [[ ${git_status} =~ ${untracked_pattern} ]]; then
            state="${CYAN}"
        #nothing to commit
        else
            state="${GREEN}"
        fi

        # add an else if or two here if you want to get more specific
        # show if we're ahead or behind HEAD
        remote=""
        if [[ ${git_status} =~ ${remote_pattern} ]]; then
            found="${BASH_REMATCH[1]}"
            if [[ ${found} == "ahead" ]]; then
                remote="${COLOR_NONE}↑"
            elif [[ ${found} == "behind" ]]; then
                remote="${COLOR_NONE}↓"
            fi
        fi
        #diverged branch
        if [[ ${git_status} =~ ${diverge_pattern} ]]; then
            remote="${RED}↕"
        fi

        #branch name
        if [[ ${git_status} =~ ${branch_pattern} ]]; then
            branch=${BASH_REMATCH[1]}
        #detached branch
        elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
            branch="NO BRANCH"
        fi

      VERSION_CONTROL_STATUS="${COLOR_NONE}${remote}${state}${branch}${COLOR_NONE}"
    else
      VERSION_CONTROL_STATUS=""
    fi

    return
}

function parse_node_version {
  NODE_VERSION=`node -v`
  echo "${NODE_VERSION:1}"
}

function parse_ruby_version {
  # chruby
  [ "$RUBY_VERSION" == "" ] && echo 'system' || echo $RUBY_VERSION
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
    PROMPT_SYMBOL="\$"
  else
    PROMPT_SYMBOL="${RED}\$${COLOR_NONE}"
  fi
}

function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the VERSION_CONTROL_STATUS variable.
  parse_git_branch

  # Set the bash prompt variable.
  PS1="${LIGHT_GRAY}\u@\h ${COLOR_NONE}\w ${GREEN}$(parse_node_version) ${RED}$(parse_ruby_version) ${VERSION_CONTROL_STATUS} ${COLOR_NONE}${PROMPT_SYMBOL} "
}

PROMPT_COMMAND="set_bash_prompt;$PROMPT_COMMAND"
