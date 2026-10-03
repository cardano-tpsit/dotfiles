ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{!%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


# Riga 1: Solo la cartella corrente e le info di Git
PROMPT=$'\n'
PROMPT+="%{$fg_bold[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

# Nuova linea, utilizzando il formato corretto per l'espansione.
PROMPT+=$'\n'

# Riga 2: Solo la freccia (senza spazi finali per non far apparire il $)
#PROMPT+='%(?:%{$fg_bold[white]%}%1{$%} :%{$fg_bold[red]%}%1{➜%} )'
PROMPT+='%(?:%{$fg[white]%}%1{$%} :%{$fg[red]%}%1{$%} )'
