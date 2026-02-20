#!/bin/bash
set -e

# --- Modifica Logica Parametri ---
if [ "$#" -eq 1 ]; then
  # Se c'è un solo parametro, usalo per entrambi
  USER_NAME="$1"
  GROUP_NAME="$1"
elif [ "$#" -eq 2 ]; then
  # Se ce ne sono due, assegnali normalmente
  USER_NAME="$1"
  GROUP_NAME="$2"
else
  echo "Uso: $0 <utente> [gruppo]"
  echo "Nota: Se il gruppo viene omesso, verrà usato il nome utente."
  exit 1
fi
# ---------------------------------

USER_HOME=$(eval echo "~$USER_NAME")

echo "=========================================="
echo "Installing Neovim and all dependencies..."
echo "User: $USER_NAME, Group: $GROUP_NAME"
echo "=========================================="

# Update package list
apt-get update

# Install core build tools and utilities
echo "Installing core build tools..."
apt-get install -y build-essential cmake gettext curl wget unzip tar gzip

# Install Git and related tools
echo "Installing Git..."
apt-get install -y git git-all

# Install Node.js and npm
echo "Installing Node.js and npm..."
apt-get remove -y nodejs npm || true
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

echo "Node.js version: $(node --version)"
echo "npm version: $(npm --version)"

# Install Python tools
echo "Installing Python tools..."
apt-get install -y python3 python3-pip python3-venv python3-debugpy

# Install search and file tools
echo "Installing search tools..."
apt-get install -y ripgrep fd-find
ln -sf /usr/bin/fdfind /usr/bin/fd

# Install clipboard tools
echo "Installing clipboard tools..."
apt-get install -y xclip wl-clipboard

# Install Lua and LuaRocks
echo "Installing Lua tools..."
apt-get install -y lua5.1 luajit luarocks

# Install C/C++ tools
echo "Installing C/C++ development tools..."
apt-get install -y clangd clang clang-format clang-tidy lldb gdb valgrind

# Install additional useful tools
echo "Installing additional utilities..."
apt-get install -y tree htop wget ca-certificates

# Clean up apt cache
rm -rf /var/lib/apt/lists/*

echo "=========================================="
echo "Downloading and installing Neovim..."
echo "=========================================="

cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf /opt/nvim-linux-x86_64
tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

echo "=========================================="
echo "✓ Neovim installed successfully!"
echo "=========================================="
echo "Location: /opt/nvim-linux-x86_64/bin/nvim"

# Creazione directory Neovim per l’utente
echo ""
echo "=========================================="
echo "Setting up Neovim directories for $USER_NAME..."
echo "=========================================="

NVIM_DIRS=(
  "$USER_HOME/.local/share/nvim"
  "$USER_HOME/.local/share/nvim/mason"
  "$USER_HOME/.local/share/nvim/mason/bin"
  "$USER_HOME/.local/state/nvim"
  "$USER_HOME/.cache/nvim"
  "$USER_HOME/.config/nvim"
)

for dir in "${NVIM_DIRS[@]}"; do
  mkdir -p "$dir"
  chown -R "$USER_NAME:$GROUP_NAME" "$dir"
  echo "✓ Created: $dir"
done

# Copia cartella nvim nello script in ~/.config/nvim
if [ -d "./nvim" ]; then
  cp -r ./nvim/* "$USER_HOME/.config/nvim/"
  chown -R "$USER_NAME:$GROUP_NAME" "$USER_HOME/.config/nvim"
  echo "✓ Copied nvim configuration to $USER_HOME/.config/nvim"
fi

# Aggiorna PATH
echo "" >>"$USER_HOME/.bashrc"
echo "# Neovim configuration" >>"$USER_HOME/.bashrc"
echo 'export PATH="/opt/nvim-linux-x86_64/bin:$PATH"' >>"$USER_HOME/.bashrc"
echo 'export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"' >>"$USER_HOME/.bashrc"
chown "$USER_NAME:$GROUP_NAME" "$USER_HOME/.bashrc"

# Aggiorna PATH anche a livello di sistema
echo 'PATH="/opt/nvim-linux-x86_64/bin:'"$USER_HOME"'/.local/share/nvim/mason/bin:$PATH"' >>/etc/environment

echo ""
echo "=========================================="
echo "✓ Setup completed for user $USER_NAME!"
echo "=========================================="
echo "To use Neovim, switch to $USER_NAME and run: nvim"
