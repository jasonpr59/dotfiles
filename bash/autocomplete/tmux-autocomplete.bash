# file: tmux-autocomplete
# tmux-autocomplete.bash parameter-completion
# This is a very basic script for allowing tab-completion of
# tmux session names.  It is very naive: it will always attempt
# to complete the current word to a tmux session name, even if
# it is not appropriate to put a session name in the current spot.

_TmuxAutoComplete ()
{
so_far="${COMP_WORDS[COMP_CWORD]}"
COMPREPLY=()

for session_colon in `tmux ls | awk '{print $1}'`
do
    session=${session_colon%?}
    if [[ $session == $so_far* ]]; then
        COMPREPLY+=($session)
    fi
done
return 0
}

complete -F _TmuxAutoComplete tmux
