source ~/.profile

BASHFILES="$HOME/dotfiles/bash"
# Exports comes first, aliases second.
source $BASHFILES/exports.sh
source $BASHFILES/aliases.sh
# All others can come in any order.
source $BASHFILES/path.sh
source $BASHFILES/git.sh
source $BASHFILES/prompt.sh
source $BASHFILES/history.sh
source $BASHFILES/color.sh
source $BASHFILES/ruby.sh
source $BASHFILES/completion.sh
