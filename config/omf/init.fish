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
function ll       ; tree --dirsfirst -ChFupDaLg 1 $argv ; end
function c        ; clear ; end

# Abbreviations
abbr gc git commit
abbr gp git push
abbr gpt git push --tags
abbr gP git pull
abbr gr git rebase
abbr gl git lg
abbr gd git diff
abbr ll exa -lah

abbr r ranger

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
abbr df cd ~/git/dotfiles
abbr gf cd ~/git

# Utilities
function rst      ; exec fish ; end
function v        ; nvim $argv ; end
function g        ; git $argv ; end
function tmux     ; command tmux -2 $argv ; end
function gs       ; git status ; end
function gaa      ; git add . ; end
function gh       ; git log --follow -p --stat --abbrev-commit --decorate -- $argv; end
function oa       ; open -a $argv ; end
function rm       ; trash $argv ; end

function ys       ; yarn add $argv ; end
function yd       ; yarn add --dev $argv ; end

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

# Fun
function moo # Random cowsay
  set cows_dir /usr/local/Cellar/cowsay/3.04/share/cows
  set avatar (ls $cows_dir | gshuf -n1|cut -d'.' -f1)
  fortune | cowsay -f $avatar | lolcat -t
end

function rage
  set PASTA 'What the fuck did you just fucking say about me, you little bitch? I’ll have you know I graduated top of my class in the Navy Seals, and I’ve been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills. I am trained in gorilla warfare and I’m the top sniper in the entire US armed forces. You are nothing to me but just another target. I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words. You think you can get away with saying that shit to me over the Internet? Think again, fucker. As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot. The storm that wipes out the pathetic little thing you call your life. You’re fucking dead, kid. I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that’s just with my bare hands. Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit. If only you could have known what unholy retribution your little “clever” comment was about to bring down upon you, maybe you would have held your fucking tongue. But you couldn’t, you didn’t, and now you’re paying the price, you goddamn idiot. I will shit fury all over you and you will drown in it. You’re fucking dead, kiddo.'
  set cows_dir /usr/local/Cellar/cowsay/3.04/share/cows
  set avatar (ls $cows_dir | gshuf -n1|cut -d'.' -f1)
  echo $PASTA | cowsay -f $avatar | lolcat -t
end

# PMosh open man pages in pdf format
function pmosh
  man -t $argv | open -f -a /Applications/Preview.app
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
