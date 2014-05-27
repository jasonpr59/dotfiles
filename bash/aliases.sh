# Replace newlines with null bytes.
alias nl2nul="tr '\n' '\0'"

# Get latest downloads.
alias dls="ls -t $DOWNLOADS/ | nl2nul | xargs -0 -L0 -I {} echo \"\$HOME/Downloads/{}\""

# Colorize ls output.
alias ls="ls -p"

# Colorize grep output.
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Show all todos in this directory.
alias todos="grep -ri 'todo' ."

# Reload the bash profile.
alias reprof='source $HOME/.bash_profile && echo "Sourced bash profile."'

# Open emacs in the terminal, not in a window.
alias emacs='emacs -nw'

# Print the MIT athena combo.
# Requires that `mit` is an SSH alias for your MIT account.
# Prompts for your MIT password.
alias combo='ssh mit tellme combo'
