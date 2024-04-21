
下载nvim
```
$ wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
```
centos 支持运行image:
```bash
$ yum install fuse-devel fuse-libs fuse
$ lsmod | grep fuse
$ modprobe fuse
$ lsmod | grep fuse
```
可选: centos安装devtools:
```
$ yum install centos-release-scl
$ yum install devtoolset-7
# 开启方法1:
$ scl enable devtoolset-7 bash # sch enable devtoolset-7 zsh
# 开启方法2: 可以在.zshrc里面source
source /opt/rh/devtoolset-7/enable
```

pip安装pynvim
```
$ pip3.8 install pynvim --user
```

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

```bash
// centos
$ yum install yum-utils.noarch
$ yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
$ yum install ripgrep
// ubuntu
$ wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

```bash
wget https://github.com/sharkdp/fd/releases/download/v8.5.3/fd-v8.5.3-x86_64-unknown-linux-musl.tar.gz
tar -xvf fd-v8.5.3-x86_64-unknown-linux-musl.tar.gz
cp fd /usr/local/bin
cp fd.1 /usr/local/share/man/man1/
mandb
```

安装node, npm: [安装教程](https://www.runoob.com/nodejs/nodejs-install-setup.html)
```
$ wget https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-x64.tar.xz # for ubuntu20.04
#$  wget https://nodejs.org/dist/v17.9.1/node-v17.9.1-linux-x64.tar.xz # for ubuntu18.04
$ tar xf node-v18.12.1-linux-x64.tar.xz
#$ tar xf node-v17.9.1-linux-x64.tar.xz
# 设置zsh PATH
```

`npm install -g neovim`


执行`:PlugInstall`


通过执行`:Mason`命令安装语言服务器: clangd, pyright等


# 其它相关
1. 安装cmake
```bash
$ wget https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.25.1-linux-x86_64.sh
$ chmod 755 cmake-3.25.1-linux-x86_64.sh
$ sudo sh cmake-3.25.1-linux-x86_64.sh
# 设置环境变量
```

2. 安装git[安装说明](https://git-scm.com/download/linux)
```bash
$ sudo add-apt-repository ppa:git-core/ppa
$ sudo apt update
$ sudo apt install git
```

3. 安装xclip, 方便系统和vim之前相互复制:
```bash
$ sudo apt install xclip
```

4. 使用wsl2时, 要使剪切板生效, 需要在`init.vim`中添加(这些脚本可以通过`help clipboard-wsl`得到):
```bash
let g:clipboard = {
		\   'name': 'WslClipboard',
		\   'copy': {
		\      '+': 'clip.exe',
		\      '*': 'clip.exe',
		\    },
		\   'paste': {
		\      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		\      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		\   },
		\   'cache_enabled': 0,
                \ }
```
