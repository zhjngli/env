### zsh theme for zli

ZSH_THEME_GIT_PROMPT_PREFIX="<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[009]"
ZSH_THEME_GIT_PROMPT_CLEAN="$FG[010]"

# for some reason fg and fg_bold don't work here
eval muted_color='$FG[116]'
local login_info="%{$muted_color%}%n@%m"
local datetime="%{$muted_color%}(%D{%F %r %z})"
# ${PWD/#HOME/~ can be a replacement for %~
local current_pwd="%{$fg_bold[cyan]%}%~"

git_prompt_info() {
    local branch=$(git_current_branch)
    if [ -n "$branch" ]; then
        echo -n $(parse_git_dirty)
        echo -n $ZSH_THEME_GIT_PROMPT_PREFIX
        echo -n "${branch}"
        echo -n $ZSH_THEME_GIT_PROMPT_SUFFIX
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}λ= :%{$fg_bold[red]%}λ= )"

PROMPT='
${datetime} ${login_info}::${current_pwd} $(git_prompt_info)
${ret_status}%{$reset_color%}'


