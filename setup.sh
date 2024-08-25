echo "Creating symbolic links for nvim, tmux"
mkdir -p ~/.config
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/.tmux/
mkdir -p ~/.config/fish/

ln -sf "$(pwd)/dotfiles/nvim" ~/.config
ln -sf "$(pwd)/dotfiles/tmux" ~/.config
ln -sf "$(pwd)/dotfiles/fish" ~/.config

echo "Cloning tpm"
rm -rf ~/.config/tmux/plugins/

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/

echo "InstalL TMUX plugins"
tmux -f ~/.config/tmux/.tmux.conf start-server
tmux new-session -d -A -s main
~/.config/tmux/plugins/bin/install_plugins
tmux kill-server
