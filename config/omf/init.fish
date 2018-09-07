# Disable initial Fish Greeting
set fish_greeting

# Disable fish underline prompt
# To re-enable do set fish_color_valid_path --underline
set fish_color_valid_path

# Navigation
function ..       ; cd .. ; end
function ...      ; cd ../.. ; end
function ....     ; cd ../../.. ; end
function .....    ; cd ../../../.. ; end
function ......   ; cd ../../../../.. ; end
function c        ; clear ; end

# Abbreviations
abbr gc git commit
abbr gp git push
abbr gpt git push --tags
abbr gP git pull
abbr gb git branch
abbr gco git checkout
abbr gr git rebase
abbr gl git lg
abbr gd git diff
abbr ll exa -lah
abbr x exit

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

abbr t tmuxinator

# Repeated paths
abbr df cd ~/dotfiles
abbr gf cd ~/git

# Utilities
function rst      ; exec fish ; end
function v        ; nvim $argv ; end
function g        ; git $argv ; end
function dc       ; docker-compose $argv ; end
function tmux     ; command tmux -2 $argv ; end
function gs       ; git status ; end
function gaa      ; git add . ; end
function gh       ; git log --follow -p --stat --abbrev-commit --decorate -- $argv; end
function oa       ; open -a $argv ; end
function rm       ; trash $argv ; end

function ys       ; yarn add $argv ; end
function yd       ; yarn add --dev $argv ; end
function ydl      ; youtube-dl $argv ; end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
      set -l cmd (commandline -o)
      set -e cmd[1]
      complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion g 'git'
make_completion v 'nvim'
make_completion dc 'docker-compose'
make_completion ydl 'youtube-dl'

# Fun
function moo # Random cowsay
  set cows_dir /usr/local/Cellar/cowsay/3.04/share/cows
  set avatar (ls $cows_dir | gshuf -n1|cut -d'.' -f1)
  fortune | cowsay -f $avatar | lolcat -t
end

# PMosh open man pages in pdf format
function pmosh
  man -t $argv | ps2pdf - /tmp/$argv.pdf
  open /tmp/$argv.pdf
end

# gif2mp4
# https://rigor.com/blog/2015/12/optimizing-animated-gifs-with-html5-video
function gif2mp4
  ffmpeg -i $argv -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $argv.mp4
end

function removeSound
  ffmpeg -i $argv -vcodec copy -an muted.$argv
end

function mov2mp4
  ffmpeg -i $argv -vcodec copy -acodec copy $argv.mp4
end

# Add an extra slot in the dock for management purposes
function dockspacer
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  killall Dock
end

function yu
  brew upgrade yarn
end

# Brew update and cleanup
function bu
  brew upgrade
  brew cleanup
end

# Update nvm
# https://github.com/creationix/nvm#install-script
function nvm-update
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
end

function update
  echo 'Updating homebrew stuff...' | cowsay | lolcat -t
  brew update
  brew upgrade
  brew cleanup
  echo 'Updating Neovim...' | cowsay | lolcat -t
  nvim -c 'PlugUpdate' -c 'qa'
  set currentPath (pwd)
  echo 'Updating Yarn Packages...' | cowsay | lolcat -t
  cd ~/.config/yarn/global
  ncu -a
  yarn
  echo 'Back to business lets get it! #HUSTLE' | cowsay | lolcat -t
  cd $currentPath
end

function cleanup
  find . -type f -name '*.DS_Store' -ls -delete
end

# Enable/disable Shadow on screenshots
function shadow
  switch (echo $argv)
    case disable
      defaults write com.apple.screencapture disable-shadow -bool TRUE
      killall SystemUIServer
      echo '😵 Shadows have been disabled for screenshots'
    case enable
      defaults write com.apple.screencapture disable-shadow -bool FALSE
      killall SystemUIServer
      echo '👻 Shadows have been enabled for screenshots'
    case '*'
      echo 'Provide argument enable or disable'
  end
end

function focus
  open focus://focus
  switch (echo $argv)
    case enable
      open focus://focus
      echo '🧐  You have focused...'
    case disable
      open focus://unfocus
      echo '🐔 You have unfocused...'
    case '*'
      open focus://toggle
      echo '🚀 Toggled focus...'
  end
end

function simulator
  oa Simulator
end
