source $HOME/.bashrc
source $HOME/.aliases

export CDPATH="$CDPATH:$HOME/dev"

function cdto { cd $(cdto.rb $1); }

# speedup jvm boot and jruby
export JAVA_OPTS="-d32 -client"
export JRUBY_OPTS="-X-C"

export EDITOR=subl
export PAGER=less
export BROWSER=chromium

# load direnv
eval "$(direnv hook $0)"

# rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# rbfu
#eval "$(rbfu --init --auto)"

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Set GREP highlight color to red
export GREP_COLOR='1;31'

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

function parse_ruby_version {
  # rbenv
  #rbenv version-name

  # plain (slow)
  # ruby -v | sed "s/ruby \([^ ]*\).*/\1/"

  # rbfu
  #[ "$RUBY_VERSION" == "" ] && echo 'system' || echo $RBFU_RUBY_VERSION

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
  PS1="${LIGHT_GRAY}\u@\h ${COLOR_NONE}\w ${RED}$(parse_ruby_version) ${VERSION_CONTROL_STATUS} ${COLOR_NONE}${PROMPT_SYMBOL} "
}

PROMPT_COMMAND="set_bash_prompt;$PROMPT_COMMAND"
