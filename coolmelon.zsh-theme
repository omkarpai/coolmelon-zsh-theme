typeset +H _return_status="%(?..❗)"

right_triangle() {
   echo $'\ue0b0'
}

prompt_indicator() {
   echo "%{$FG[046]%}$%{$reset_color%}"
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

function _user_host() {
  local me
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m "
  elif [[ $LOGNAME != $USERNAME ]]; then
    me="%n "
  fi
  if [[ -n $me ]]; then
    echo "%{$FG[046]%}$me%{$reset_color%}"
  fi
}



 _current_dir (){
 	echo "%{$FG[027]%}[%{$FG[051]%} %2~ %{$FG[027]%}]%{$reset_color%}"
 }

current_time() {
   echo "%{$fg[white]%}%*%{$reset_color%}"
}

git_prompt() {
   local git
   git=$(git_prompt_info)
   if [[ -n $git ]]; then
   	echo "%{$FG[069]%}on (%{$FG[046]%} $git %{$reset_color%}%{$FG[069]%})%{$reset_color%}"
    fi
}



function _node() {
   local version
   version=$(node -v 2>/dev/null) || version=""
   if [ "$version" != "" ]; then
    		echo "%{$FG[040]%}node[$version]%{$reset_color%}"
	else
    		echo ""
	fi
}




# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='%B%{$FG[237]%}----------------------------------------------------------------%{$reset_color%}%b
%{$FG[046]%}╭─%{$reset_color%}${_return_status}$(_user_host)$(_current_dir) $(git_prompt) 
%{$FG[046]%}╰───➤%{$reset_color%} $(prompt_indicator) '



RPROMPT='%{$(echotc UP 1)%}$(_node)%{$(echotc DO 1)%}'
