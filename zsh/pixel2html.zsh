# do pixel2html stuff from the terminal
function pixel2html() {
  emulate -L zsh

  typeset -A urls
  urls=(
    code "http://code.pixel2html.com/"
    gitlab "http://code.pixel2html.com/"
    dashboard "https://www.pixel2html.com/dashboard"
    slack "http://pixel2html.slack.com"
    go "http://pixel2html.com"
  )

  if [[ -z "$urls[$1]" ]]; then
    echo "Pixel2Html Command: $1 not supported."
    return 1
  fi
  url="${urls[$1]}"
  open_command "$url"
}

alias pixel='pixel2html'
