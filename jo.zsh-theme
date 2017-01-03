# Borrowing shamelessly from these oh-my-zsh themes:
#   fino (and transitively from bira and robbyrussell)
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7. (and multiple Linux distros)

# You can set your computer name in the ~/.box-name file if you want.

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'


PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} %{$FG[239]%}%{$reset_color%}
╰─$(virtualenv_info)$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$FG[196]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$FG[196]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"
