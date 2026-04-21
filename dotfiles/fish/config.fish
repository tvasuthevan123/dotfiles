if status is-interactive
    # Commands to run in interactive sessions can go here
end

# string match -q "$TERM_PROGRAM" vscode
# and . (code --locate-shell-integration-path fish)

/opt/homebrew/bin/brew shellenv | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

source ~/.asdf/plugins/java/set-java-home.fish

asdf completion fish > ~/.config/fish/completions/asdf.fish

set -x JBR_PATH "/Users/thanuj/.asdf/installs/java/jbr_jcef-21.0.8-osx-aarch64-b895.146/Contents/Home"
# set -x CHROME_EXECUTABLE "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
set -g -x CONFIG_PATH "$HOME/.config"
set -g -x OPENCODE_EXPERIMENTAL true



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
pyenv init - fish | source

fish_add_path $HOME/.local/bin

# Added by Antigravity
fish_add_path /Users/thanuj/.antigravity/antigravity/bin
