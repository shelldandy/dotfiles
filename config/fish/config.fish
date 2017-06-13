# Exports
set -x EDITOR nvim
set -x HOMEBREW_CASK_OPTS '--appdir=~/Applications'
set -x TERM xterm-256color-italic

# Tiny Care Terminal
set -gx TTC_BOTS 'tinycarebot,selfcare_bot,magicrealismbot'
set -gx TTC_REPOS '~/git'
set -gx TTC_WEATHER 'Puebla'
set -gx TTC_APIKEYS false
set -gx TTC_UPDATE_INTERVAL 20

set ANDROID_HOME $HOME/Library/Android/sdk
test -d $ANDROID_HOME/tools ; and set PATH $ANDROID_HOME/tools $PATH
test -d $ANDROID_HOME/platform-tools ; and set PATH $ANDROID_HOME/platform-tools $PATH

# Making syntax highlight work with Fish
set hilite (which src-hilite-lesspipe.sh)
set -x LESSOPEN "| $hilite %s"
set -x LESS " -R -X -F "

# Fishy Fixes for the prompt with default theme
set fish_pager_color_progress cyan
function fish_right_prompt
  set_color white
  date "+%H:%M:%S"
  set_color normal
  printf "\n"
end

# Trying a fancy fishy prompt
# You can override some default options with config.fish:
function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish     "⋊>"
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l dirty    "⨯"
  set -l none     "◦"

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color $fish_pager_color_progress ^/dev/null; or set_color cyan)
  set -l error_color      (set_color $fish_color_error ^/dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote ^/dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd ^/dev/null; or set_color green)


  if git_is_repo

    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel ^/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")

      echo -n -s $directory_color $cwd $normal_color
    else
      echo -n -s $directory_color $cwd $normal_color
    end

    echo -n -s " on " $repository_color (git_branch_name) $normal_color " "

    if git_is_touched
      echo -n -s $dirty
    else
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end

  else
    echo -n -s " " $directory_color $cwd $normal_color
  end

  printf "\n"

  if test $last_command_status -eq 0
    echo -n -s $success_color $fish $normal_color " "
  else
    echo -n -s $error_color $fish $normal_color " "
  end
end
