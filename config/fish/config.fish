# Making syntax highlight work with Fish
set hilite (which src-hilite-lesspipe.sh)
set -x LESSOPEN "| $hilite %s"
set -x LESS " -R -X -F "
