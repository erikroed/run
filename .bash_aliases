command -v nvim > /dev/null && alias vim='nvim'
alias bc='vim ~/.bashrc'
alias bca='vim ~/.bash_aliases'
alias sbc='source ~/.bashrc'
alias tns='tmux new-session -s'
alias lg='lazygit'
command -v fdfind > /dev/null && alias fd='fdfind'
command -v batcat > /dev/null && alias cat='batcat'

alias k=kubectl
complete -o default -F __start_kubectl k
