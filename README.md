# .dotfiles
bakcup for my dotfiles

via: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html

## TL;DR

```
git init --bare "$HOME/.dotfiles"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no

dotfiles remote add origin git@github.com:livexia/.dotfiles.git 
dotfiles branch --set-upstream-to=origin/main main
dotfiles push  --set-upstream origin main

dotfiles add .config/nvim
dotfiles commit ...
dotfiles push
```

## New Machine

```
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:livexia/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no
rm -r tmpdotfiles
```

## More Setup(init_setup.sh)

```shell
# zsh curl wget
# using package manager install zsh curl wget

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# .dotfiles
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/livexia/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no
rm -r tmpdotfiles
omz reload

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
omz reload

# starship
curl -sS https://starship.rs/install.sh | sh
omz reload

# zoxide
cargo install zoxide --locked
omz reload

# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
omz reload

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
omz reload

# asdf plugin
asdf plugin add python
asdf plugin add nodejs
asdf plugin add java
asdf plugin add neovim
omz reload

# lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# npm install yarn for markdown previewer
npm -g yarn
```
