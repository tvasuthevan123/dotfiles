if status is-interactive
    # Commands to run in interactive sessions can go here
end

# string match -q "$TERM_PROGRAM" vscode
# and . (code --locate-shell-integration-path fish)

/opt/homebrew/bin/brew shellenv | source 

# set -x CHROME_EXECUTABLE "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
set -g -x CONFIG_PATH "$HOME/.config"

alias ls="eza -l --git --icons"
alias tree="eza -TL"
alias fgc="git commit -am '<chore>: Apply formatting'"
alias pers="cd ~/Documents/personal"

# if [ -f '/Users/thanuj/google-cloud-sdk/path.fish.inc' ]
#     . '/Users/thanuj/google-cloud-sdk/path.fish.inc'
# end

if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

set -x NVM_DIR $HOME/.nvm

#set -x DENO_INSTALL $HOME/.deno
#fish_add_path $HOME/.deno
#fish_add_path $DENO_INSTALL/bin
uv generate-shell-completion fish | source

# uv
fish_add_path "/Users/thanuj/.local/bin"

load_nvm > /dev/stderr

starship init fish | source
