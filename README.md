### taikishiino dotfiles

- bashの場合
```bash
$ cd ~/
$ git clone https://github.com/taikishiino/dotfiles.git
$ ln -sf ~/dotfiles/.vimrc ~/.vimrc
$ ln -sf ~/dotfiles/.bashrc ~/.bashrc
$ ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

# bash_profileの内容を読み込む
source ~/.bash_profile
```

- zshの場合
```bash
$ cd ~/
$ git clone https://github.com/taikishiino/dotfiles.git
$ ln -sf ~/dotfiles/.vimrc ~/.vimrc
$ ln -sf ~/dotfiles/.zshrc ~/.zshrc

# zshrc の内容を読み込む
source ~/.zshrc
```
