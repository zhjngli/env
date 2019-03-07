### zsh theme for zli
# https://wiki.archlinux.org/index.php/zsh
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Visual-effects

ZSH_THEME_GIT_PROMPT_PREFIX="<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">%b%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{185}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{155}"

# for some reason fg and fg_bold don't work here
eval muted_color='%F{244}'
local login_info="%{$muted_color%}[%n@%m]%f"
local datetime="%{$muted_color%}(%D{%F %r %z})%f"
# ${PWD/#HOME/~ can be a replacement for %~
local current_pwd="%B%F{080}%~%b%f"

git_prompt_info() {
    local branch=$(git_current_branch)
    if [ -n "$branch" ]; then
        echo -n $(parse_git_dirty)
        echo -n $ZSH_THEME_GIT_PROMPT_PREFIX
        echo -n "${branch}"
        echo -n $ZSH_THEME_GIT_PROMPT_SUFFIX
    fi
}

local ret_status="%B%(?:%F{002}λ= :%F{001}λ= )"

PROMPT='${datetime} ${current_pwd} $(git_prompt_info)
${login_info} ${ret_status}%b%f'

