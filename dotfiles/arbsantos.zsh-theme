PROMPT="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[red]%}%M"
PROMPT+=' %{$fg[white]%}%c%{$reset_color%} $(git_prompt_info)%{$fg[red]%}$ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[red]%} ✖%{$fg[blue]%}) "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}%{$fg[green]%} ✔%{$fg[blue]%}) "
