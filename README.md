
更新vim-plug:
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

安装fzf, ripgrep, fd

```bash
$git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$~/.fzf/install
```

```
$ yum install yum-utils.noarch
$ yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
$ yum install ripgrep
// ubuntu
$ wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb
```


```
wget https://github.com/sharkdp/fd/releases/download/v8.5.3/fd-v8.5.3-x86_64-unknown-linux-musl.tar.gz
tar -xvf fd-v8.5.3-x86_64-unknown-linux-musl.tar.gz
cp fd /usr/local/bin
cp fd.1 /usr/local/share/man/man1/
mandb
```


安装node, npm

npm install -g neovim



执行`:PlugInstall`


通过执行`:Mason`命令安装语言服务器: clangd, pyright等


