# .dotfiles
bakcup for my dotfiles

via: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html

TL;DR:

```
git init --bare "$HOME/.dotfiles"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no

dotfiles add .config/nvim
dotfiles commit ...
dotfiles push
```
