echo "Create .config directory"
mkdir -p ~/.config

echo "Symlinks"
ln -sf "$(pwd)/dotfiles/nvim" ~/.config
ln -sf "$(pwd)/dotfiles/tmux" ~/.config
ln -sf "$(pwd)/dotfiles/fish" ~/.config

echo "Reset TMUX Plugins Folder"
rm -rf ~/.config/tmux/plugins/
mkdir -p ~/.config/tmux/plugins/

echo "Clone TPM"
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

echo "Install TMUX plugins"
tmux start-server
tmux new-session -d -A -s main
~/.config/tmux/plugins/tpm/bin/install_plugins
tmux kill-server
