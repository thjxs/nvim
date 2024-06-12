# neovim

neovim config

## Install

Linux

```sh
git clone https://github.com/thjxs/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Windows

```sh
git clone https://github.com/thjxs/nvim.git %userprofile%\AppData\Local\nvim\
```

## Dependencies

额外工具

- git, make, unzip, gcc
- ripgrep
- nerd font
- 语言设置，如：node, rust 等

```sh
# Fedora
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```

注：使用 `checkhealth` 检查异常

注：并不是所有警告都需要修复

