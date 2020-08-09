# Disable initial Fish Greeting
set fish_greeting

# Disable fish underline prompt
# To re-enable do set fish_color_valid_path --underline
set fish_color_valid_path

source ~/.config/omf/functions.fish

# Abbreviations
abbr gc git commit
abbr gp git push
abbr gpt git push --tags
abbr gP git pull
abbr gb git branch
abbr gco git checkout
abbr gxo git checkout
abbr gr git rebase
abbr gl git lg
abbr gd git diff
abbr ll exa -lah
abbr x exit
abbr k kubectl

abbr r ranger
abbr f fuck

# git add remote
# for pushing to 2 remotes at once
# https://stackoverflow.com/questions/14290113/git-pushing-code-to-two-remotes#14290145
abbr gar git remote set-url --add --push origin

abbr nI npm install --save
abbr nD npm install --save-dev

abbr nvi nvim -c 'PlugInstall' -c 'qa'
abbr nvc nvim -c 'PlugClean' -c 'qa'
abbr nvu nvim -c 'PlugUpdate' -c 'qa'

# Repeated paths
abbr df cd ~/dotfiles
abbr gf cd ~/git

make_completion g 'git'
make_completion v 'nvim'
make_completion dc 'docker-compose'
make_completion ydl 'youtube-dl'
