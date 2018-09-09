function changeIterm --argument-names theme
  echo -e "\033]1337;SetProfile=$theme\a"
end

function changeShellTheme --argument-names theme
  source ~/.themes/$theme.sh
end

function theme
  switch (echo $argv)
    case gruvbox
      changeIterm gruvbox
      changeShellTheme gruvbox-dark
    case pencil
      changeIterm pencil
      changeShellTheme pencil
    case pencil-dark
      changeIterm pencil-dark
      changeShellTheme pencil-dark
    case '*'
      echo 'Pick between gruvbox pencil or pencil-dark' | lolcat
  end
end
