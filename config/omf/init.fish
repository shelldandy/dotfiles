# Disable initial Fish Greeting
set fish_greeting

# Exports
set -x EDITOR nvim
set -x HOMEBREW_CASK_OPTS '--appdir=~/Applications --caskroom=/etc/Caskroom'
set -x TERM xterm-256color-italic

set ANDROID_HOME $HOME/Library/Android/sdk
set PATH $ANDROID_HOME/tools $PATH
set PATH $ANDROID_HOME/platform-tools $PATH

# Highlight stuff with less
set hilite (which highlight)
set -x LESSOPEN "| $hilite %s --out-format xterm256 --quiet --force "
set -x LESS " -R"


# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end
function c        ; clear ; end

# Utilities
function rst      ; exec fish ; end
function v        ; nvim ; end
function g        ; git $argv ; end
function tmux     ; command tmux -2 $argv ; end
function gs       ; git status ; end
function gaa      ; git add . ; end
function gc       ; git commit ; end
function gp       ; git push ; end
function gP       ; git pull ; end
function gr       ; gir rebase ; end
function oa       ; open -a $argv ; end

function ys       ; yarn add $argv ; end
function yd       ; yarn add --dev $argv ; end

function less
    command less -m -N -g -i -J --underline-special --SILENT $argv
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

make_completion g 'git'
make_completion v 'nvim'

# Fun
function moo # Random cowsay
  set cows_dir /usr/local/Cellar/cowsay/3.04/share/cows
  set avatar (ls $cows_dir | gshuf -n1|cut -d'.' -f1)
  fortune | cowsay -f $avatar | lolcat
end
