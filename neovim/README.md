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


# per installare nuovi linguaggi (c++ ma vale anche per java)
1. Attivare gli "Extras" di LazyVim
LazyVim gestisce i pacchetti pre-configurati tramite gli Extras. Devi abilitare sia il supporto per il DAP (Debugger) che per il C++.

Apri Neovim.

Digita :LazyExtras.

Cerca e abilita (premendo x) le seguenti voci:

dap.core (fondamentale per il debugging)

lang.clangd (per il supporto C++)

2. Installare il debugger con Mason
Una volta abilitati gli extras, devi installare fisicamente l'estensione di Microsoft:

Digita :Mason.

Vai nella sezione DAP (o cerca premendo /).

Installa cpptools.
