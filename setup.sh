#!/bin/bash

if [ -f "./.gitconfig" ]; then
  current_config=$(cat "./.gitconfig")

  if ! grep -q "delta" "$HOME/.gitconfig"; then
    echo "$current_config" >>"$HOME/.gitconfig"
  fi

  echo "Successfully appended .gitconfig from current directory to ~/.gitconfig"
else
  echo "Error: .gitconfig file not found in the current directory."
fi

echo "Create .config directory"
mkdir -p ~/.config

echo "Symlinks"
ln -sf "$(pwd)/dotfiles/nvim" ~/.config
ln -sf "$(pwd)/dotfiles/fish" ~/.config
ln -sf "$(pwd)/dotfiles/uv" ~/.config


