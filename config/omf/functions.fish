source ~/.config/omf/theme.fish

# Navigation
function ..       ; cd .. ; end
function ...      ; cd ../.. ; end
function ....     ; cd ../../.. ; end
function .....    ; cd ../../../.. ; end
function ......   ; cd ../../../../.. ; end
function c        ; clear ; end

# Utilities
function rst      ; exec fish ; end
function v        ; nvim $argv ; end
function g        ; git $argv ; end
function dc       ; docker-compose $argv ; end
function gs       ; git status ; end
function gaa      ; git add . ; end
function oa       ; open -a $argv ; end
function rm       ; trash $argv ; end

function ys       ; yarn add $argv ; end
function yd       ; yarn add --dev $argv ; end
function ydl      ; youtube-dl $argv ; end

# Fun

function moo # Random cowsay
  set cows_dir /usr/local/Cellar/cowsay/3.04_1/share/cows
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

function mp3extract
  ffmpeg -i $argv $argv.mp3
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

# Update Yabai
function up-yabai
  # stop, upgrade, start yabai
  brew services stop yabai
  brew upgrade yabai
  brew services start yabai

  # reinstall the scripting addition
  sudo yabai --uninstall-sa
  sudo yabai --install-sa

  # load the scripting addition
  killall Dock
end

function update
  echo 'Updating homebrew stuff...' | cowsay | lolcat -t
  brew update
  brew upgrade
  brew cleanup
  echo 'Updating casks' | cowsay | lolcat -t
  brew upgrade --cask
  echo 'Updating Neovim...' | cowsay | lolcat -t
  nvim -c 'PlugUpdate' -c 'qa'
  set currentPath (pwd)
  echo 'Updating gems' | cowsay | lolcat -t
  gem update
  echo 'Updating pips' | cowsay | lolcat -t
  pip list -o | cut -d " " -f 1 | tail -n +3 | xargs pip install -U
  pip3 list -o | cut -d " " -f 1 | tail -n +3 | xargs pip3 install -U
  echo 'Updating Yarn Packages...' | cowsay | lolcat -t
  cd ~/.config/yarn/global
  ncu -u
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

function lolcow
  echo $argv | cowsay | lolcat
end

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

# Leeme
function leeme
  say -v Paulina $argv
end

function leepaste
  pbpaste | leeme
end

function read2me
  say -v Samantha $argv
end

function readpaste
  pbpaste | read2me
end

function ydp
  set currentPath (pwd)
  set url (pbpaste)
  cd ~/Downloads
  youtube-dl $url
  cd $currentPath
end

function yda
  set currentPath (pwd)
  set url (pbpaste)
  cd ~/Downloads
  youtube-dl $url -x --audio-format mp3 --audio-quality 0
  cd $currentPath
end

function man
  command man $argv | bat
end

function my_ip
  curl ifconfig.co
end
