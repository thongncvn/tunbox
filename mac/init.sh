#!/bin/sh

# TODO: change to use pkg as well
homebrew_pkg() {
  command -v brew && echo "[ok] homebrew" && return
  echo "[installing] homebrew"; /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# TODO: change to use pkg as well
ohmyzsh_pkg() {
  [ -d "$HOME/.oh-my-zsh" ] && echo "[ok] ohmyzsh" && return
  echo "[installing] ohmyzsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

pkg() {
  brew list "$1" && echo "[ok] $1" && return
  echo "[installing] $1"; brew install "$1"
}

git_pkg() {
  name="${1##*/}"
  dest="$HOME/.tunbox/$name"
  [ -d "$dest" ] && echo "[ok] $name" && return
  echo "[installing] $name"; mkdir -p "$HOME/.tunbox" && git clone "https://github.com/$1" "$dest"
}

# ============================================================
# MAIN
# ============================================================

homebrew_pkg
ohmyzsh_pkg
pkg visual-studio-code
pkg claude-code
pkg tmux
pkg neovim
git_pkg thongncvn/termedi
