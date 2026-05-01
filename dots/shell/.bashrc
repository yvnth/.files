[[ $- != *i* ]] && return

export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '

eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/scripts:$PATH"
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$GOPATH/bin"

HISTFILE="$HOME/.bash_history"
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend cmdhist lithist

export EDITOR=nvim
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
export SYSTEMD_EDITOR="$EDITOR"
export MANPAGER='nvim +Man!'

source ~/.config/shell/aliases
