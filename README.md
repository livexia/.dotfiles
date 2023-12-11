# .dotfiles
bakcup for my dotfiles

via: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html

TL;DR:

```
git init --bare "$HOME/.dotfiles"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no

dotfiles remote add origin git@github.com:anandpiyer/.dotfiles.git
dotfiles branch --set-upstream-to=origin/main main
dotfiles push  --set-upstream origin main

dotfiles add .config/nvim
dotfiles commit ...
dotfiles push
```

New Machine:

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anandpiyer/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
