## ~/.zshrc
## zsh-specific shell configuration.

#### Source base configuration from .profile
if [ -f ~/.profile ]; then
  source ~/.profile
fi


#### Pywal (https://github.com/dylanaraps/pywal.git)
## Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

## Add wal colors to TTY
if [ -f ~/.cache/wal/colors-tty.sh ]; then
  source ~/.cache/wal/colors-tty.sh
fi


#### Alias to show help for zsh builtins
unalias run-help
autoload run-help
alias help=run-help


#### Plugins
## Install by cloning to /usr/share/zsh/plugins/

## zsh-autosuggestions
## https://github.com/zsh-users/zsh-autosuggestions
# if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#   source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# fi

## zsh-vi-mode (use instead of builtin, bindkey-v)
## https://github.com/jeffreytse/zsh-vi-mode
# source /usr/share/zsh/plugins/vi-mode/vi-mode.plugin.zsh


#### Globbing
setopt EXTENDED_GLOB
setopt globdots
setopt CORRECT
setopt CORRECT_ALL
setopt AUTOCD


#### History
#HISTFILE=~/.zsh/history
#SAVEHIST=10000 ## The number of commands to be saved to the history file
## (HISTSIZE, the number of commands each session should remember, is set in .profile)
#setopt SHARE_HISTORY ## Use same history across all sessions
#setopt EXTENDED_HISTORY ## Add timestamps, command durations
#setopt HIST_REDUCE_BLANKS ## Remove suyperfluous blanks
#setopt HIST_IGNORE_SPACE ## Type space at the beginning of a command to evade history


#### Window title
## Set xwindow title to current directory, or last executed command
case $TERM in
  rxvt-unicode-256color|screen*|tmux*)
    precmd () {print -Pn "\e]0;zsh: %~\a"}
    preexec () {print -Pn "\e]0;zsh: $1\a"}
    ;;
esac


#### Prompt and greeting
## Greeting message

## Set right prompt: modified from github.com/woefe/git-prompt.zsh
source /home/max/.zsh/git-prompt.zsh/git-prompt.zsh
source /home/max/.zsh/git-prompt.zsh/prompts/rprompt.zsh

## Set left prompt
#NEWLINE=$'\n'
PROMPT='%{$fg[red]%}%(?..(%?%) )%{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) > %{$reset_color%}%'
## | %(?..[%?] )         | Shows the exit code of the last command, if unsuccessful,
##                         followed by a space.
## | 5~|%-1~/.../%3~|%4~ | Show truncated path.
##                         If the path is at least 5 elements (5~),
##                         Print the first element (%-1~), then three dots (/.../),
##                         Then, print the last three elements (%3~)
##                         Else, print the 4 or less elements (%4~).
## |  >                  | Prompt symbol, surrounded by spaces.