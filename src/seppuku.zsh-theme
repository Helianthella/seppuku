if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	PROMPT='%{$fg_bold[cyan]%}$USER@$SHORT_HOST %{$fg[green]%}%c$(git_prompt_info)%{$reset_color%} '
else
	PROMPT='%{$fg_bold[cyan]%}%% %{$fg[green]%}%c$(git_prompt_info)%{$reset_color%} '
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=":"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}]%{$fg[red]%}**"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
