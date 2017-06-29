# My dotfiles
I first started using thoughtbots dotfiles but im not really that much of a power user of all the dot things so here's my take on dotfiles with stuff i actually use on a day to day basis.

![My current terminal setup](desk.png)
![My current terminal setup](neofetch.png)

## Works best with...
In my current setup I'm using some themes and plugins to make the whole experience more enjoyable without adding weight to the startup.

- iTerm configuration files for extra swag

- Introducing Neovim support and swag

- Uses vim-plug for plugin management on neovim

- Also remember to enable true colors on your terminal and italics support to use with the OceanicNext theme and Operator Mono font. [Read More](https://bruinsslot.jp/post/how-to-enable-true-color-for-neovim-tmux-and-gnome-terminal/)

- reattach-to-user-namespace install with brew install reattach-to-user-namespace this is to make copy and paste great again on mac

- [Tmuxinator](https://github.com/tmuxinator/tmuxinator)

- [Node version manager](https://github.com/creationix/nvm)

- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

- Google Play Music Desktop Player - With a custom widget made by me :D

## Installing Everything from Scratch

- First log into your AppStore and download X-Code we will need this for git and other maybe important tools.
- Now git clone the repo

```
$ git clone https://github.com/mike3run/dotfiles.git
```

- Now cd into `scripts`

```
$ chmod +x install.sh
$ ./install.sh
```

- Sit back and enjoy
- Note: The last part of the `brew.sh` script will only work if you have also purchased those apps so you might want to edit that part or delete it totally
- I'm talking about all the commands that start with `mas install XXXXX`

- Now cd outside of the dotfiles folder and run

```
$ rcup -d dotfiles -v
```

- That will sync the actual dotfiles in your system and you can git pull for life and be in sync.

- Enjoy

- Remember to pull from time to time and in neovim run `:PlugUpdate`

💕💕💕
