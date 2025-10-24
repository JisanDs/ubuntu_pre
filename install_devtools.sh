#!/bin/bash
# -----------------------------------------------------
# install_core_devtools.sh
# Common tools for all developers (language-agnostic)
# -----------------------------------------------------

echo "🚀 Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "🐙 Installing Git & Git LFS..."
sudo apt install -y git git-lfs

echo "🐳 Installing Docker..."
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

echo "🧩 Installing Tmux (terminal multiplexer)..."
sudo apt install -y tmux

echo "💻 Installing Zsh + Bash completion..."
sudo apt install -y zsh bash-completion

echo "🔧 Installing common CLI utilities..."
sudo apt install -y curl wget htop tree jq net-tools unzip zip tar neofetch

echo "🧰 Installing build & system essentials..."
sudo apt install -y build-essential software-properties-common apt-transport-https ca-certificates gnupg lsb-release

echo "🧹 Cleaning up..."
sudo apt autoremove -y && sudo apt clean

echo "✅ Core developer tools installed successfully!"
echo "💡 Logout or reboot if Docker group permissions don't apply immediately."