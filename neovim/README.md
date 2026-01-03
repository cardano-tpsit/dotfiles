# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.


sudo apt-get install luarocks
sudo apt install pngpaste
sudo apt install -y \
  git-all \
  unzip \
  build-essential \
  nodejs \
  npm \
  python3 \
  ripgrep \
  fd-find \
  git \
  curl \
  python3-venv \
  gettext \
  cmake \
  xclip \
  wl-clipboard

# wl-clipboard allows to use system clipboard in Wayland sessions
# but requires setting 
# vim.opt.clipboard = "unnamedplus"


# Per C++ (Debugger e LSP)
sudo apt install -y clangd lldb gdb
# Per Python (Debugger)
sudo apt install -y python3-debugpy

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"