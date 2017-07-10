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
abbr gP git pull
abbr gr git rebase
abbr gl git lg
abbr ll ls -lah

abbr nI npm install --save
abbr nD npm install --save-dev

abbr nvu nvim -c 'PlugInstall'

# Utilities
function rst      ; exec fish ; end
function v        ; nvim $argv ; end
function g        ; git $argv ; end
function tmux     ; command tmux -2 $argv ; end
function gs       ; git status ; end
function gaa      ; git add . ; end
function oa       ; open -a $argv ; end

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
  fortune | cowsay -f $avatar | lolcat
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
