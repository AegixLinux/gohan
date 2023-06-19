# TANKLINUX .zshrc initially borrowed from Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b " # Old Luke default (aka the ugly one)

# Official TANKLINUX Default Colors
# PS1='%B%{%F{217}%}[%{%f%}%B%{%F{66}%}%n%{%f%}%B%{%F{217}%}@%{%f%}%B%{%F{179}%}%M %{%f%}%{%F{157}%}%~%{%f%}%B%{%F{217}%}]%{%f%}$%b '
PS1='%B%{%F{106}%}[%{%f%}%B%{%F{66}%}%n%{%f%}%B%{%F{106}%}@%{%f%}%B%{%F{179}%}%M %{%f%}%{%F{157}%}%~%{%f%}%B%{%F{106}%}]%{%f%}$%b '
# Alt 1
# PS1='%B%{%F{133}%}[%{%f%}%B%{%F{67}%}%n%{%f%}%B%{%F{133}%}@%{%f%}%B%{%F{67}%}%M %{%f%}%B%{%F{132}%}%~%{%f%}%B%{%F{133}%}]%{%f%}$%b '
# Alt 2
# PS1='%B%{%F{217}%}[%{%f%}%B%{%F{66}%}%n%{%f%}%B%{%F{209}%}@%{%f%}%B%{%F{179}%}%M %{%f%}%{%F{157}%}%~%{%f%}%B%{%F{217}%}]%{%f%}$%b '
# Ocean Theme
# PS1='%B%{%F{33}%}[%{%f%}%B%{%F{39}%}%n%{%f%}%B%{%F{45}%}@%{%f%}%B%{%F{81}%}%M %{%f%}%B%{%F{44}%}%~%{%f%}%B%{%F{33}%}]%{%f%}$%b '
# Forest theme
# PS1='%B%{%F{58}%}[%{%f%}%B%{%F{64}%}%n%{%f%}%B%{%F{100}%}@%{%f%}%B%{%F{130}%}%M %{%f%}%B%{%F{22}%}%~%{%f%}%B%{%F{58}%}]%{%f%}$%b '
# Sunset theme
# PS1='%B%{%F{202}%}[%{%f%}%B%{%F{196}%}%n%{%f%}%B%{%F{208}%}@%{%f%}%B%{%F{214}%}%M %{%f%}%B%{%F{226}%}%~%{%f%}%B%{%F{202}%}]%{%f%}$%b '
# Winter theme
# PS1='%B%{%F{111}%}[%{%f%}%B%{%F{117}%}%n%{%f%}%B%{%F{123}%}@%{%f%}%B%{%F{159}%}%M %{%f%}%B%{%F{255}%}%~%{%f%}%B%{%F{111}%}]%{%f%}$%b '
# Earth theme
# PS1='%B%{%F{94}%}[%{%f%}%B%{%F{66}%}%n%{%f%}%B%{%F{94}%}@%{%f%}%B%{%F{130}%}%M %{%f%}%B%{%F{60}%}%~%{%f%}%B%{%F{94}%}]%{%f%}$%b '
# Ocean mist
#PS1='%B%{%F{110}%}[%{%f%}%B%{%F{66}%}%n%{%f%}%B%{%F{110}%}@%{%f%}%B%{%F{245}%}%M %{%f%}%B%{%F{100}%}%~%{%f%}%B%{%F{110}%}]%{%f%}$%b '
# Muted
# PS1='%B%{%F{101}%}[%{%f%}%B%{%F{71}%}%n%{%f%}%B%{%F{101}%}@%{%f%}%B%{%F{58}%}%M %{%f%}%B%{%F{28}%}%~%{%f%}%B%{%F{101}%}]%{%f%}$%b '

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' '^ulfcd\n'

bindkey -s '^a' '^ubc -lq\n'

bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
