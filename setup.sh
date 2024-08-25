echo "Creating symbolic links for nvim, tmux"
mkdir -p ~/.config

ln -sf "$(pwd)/dotfiles/nvim" ~/.config
ln -sf "$(pwd)/dotfiles/tmux" ~/.config
ln -sf "$(pwd)/dotfiles/fish" ~/.config

echo "Cloning tpm"
rm -rf ~/.config/tmux/plugins/

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

echo "Install TMUX plugins"
tmux start-server
tmux new-session -d -A -s main
~/.config/tmux/plugins/tpm/bin/install_plugins
tmux kill-server
