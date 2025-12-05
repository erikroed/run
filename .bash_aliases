alias vim='nvim'
alias bc='vim ~/.bashrc'
alias bca='vim ~/.bash_aliases'
alias sbc='source ~/.bashrc'
alias tns='tmux new-session -s'
alias dev='ssh roed@dev'
alias lg='lazygit'
alias fd='fdfind'
alias cat='batcat'

alias k=kubectl
complete -o default -F __start_kubectl k
