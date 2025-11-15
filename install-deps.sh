#!/bin/bash

set -e

if ! [[ -f /etc/os-release ]]; then
	echo "ERROR: /etc/os-release not found"
	exit 1
fi

if ! command -v sudo &> /dev/null; then
	echo "ERROR: sudo not found"
	exit 1
fi

if ! command -v nvim &> /dev/null; then 
	echo "ERROR: nvim not found"
	exit 1
fi        

. /etc/os-release

PKGMGR=""
PKGMGR_OPTS=""
DEPS=""

if [[ "$ID" == "debian" ]]; then
	PKGMGR="apt"
	PKGMGR_OPTS="install -y"
	DEPS="gcc build-essential git curl wget unzip ripgrep fd-find xclip luarocks golang cargo ruby-full php composer default-jdk perl cpanminus tree-sitter-cli pandoc python3-full"
	sudo $PKGMGR update
elif [[ "$ID" == "fedora" ]]; then
	PKGMGR="dnf"
	PKGMGR_OPTS="install -y"
	DEPS="gcc gcc-c++ make git curl wget unzip ripgrep fd-find xclip python3 luarocks golang cargo ruby ruby-devel php composer java-latest-openjdk-devel perl perl-App-cpanminus tree-sitter-cli pandoc"
elif [[ "$ID" == "arch" ]]; then
	PKGMGR="pacman"
	PKGMGR_OPTS="-S --noconfirm --needed"
	DEPS="base-devel git curl wget unzip ripgrep fd xclip python luarocks go rust ruby php composer jdk-openjdk perl perl-app-cpanminus tree-sitter-cli pandoc"
	sudo $PKGMGR -Syu
else 
	echo "Unsupported distribution: $ID"
	exit 1
fi

echo "Installing dependencies..."
echo "Dependencies: $DEPS"
sudo $PKGMGR $PKGMGR_OPTS $DEPS

if ! command -v npm &> /dev/null; then
	echo "Installing npm..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
	nvm install 24
fi

if ! command -v julia &> /dev/null; then
	echo "Installing julia..."
	curl -fsSL https://install.julialang.org | sh -s -- -y
fi

if ! command -v uv &> /dev/null; then 
	echo "Installing uv..."
	curl -LsSf https://astral.sh/uv/install.sh | sh
	uv tool install --upgrade pynvim
fi

if command -v gem &> /dev/null; then
	echo "Installing neovim gem package..."
	gem install neovim
fi

if command -v cpanm &> /dev/null; then
	echo "Installing Neovim::Ext for perl..."
	cpanm --sudo --notest Neovim::Ext
fi

echo "--------------------------------------------------"
echo "Dependencies have been installed"
echo ""
echo "IMPORTANT: You MUST restart your terminal session"
echo "for changes to take effect."
echo "--------------------------------------------------"
