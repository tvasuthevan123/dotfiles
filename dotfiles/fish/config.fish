if status is-interactive
    # Commands to run in interactive sessions can go here
end

string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)

set -x UJ_DIR $HOME/Documents/UJ

function repos
    cd $UJ_DIR/$argv[1]
end

alias wmill-stag="wmill workspace switch staging"
alias wpull="wmill sync pull"
alias wpush="wmill sync push"
alias ls="eza -l --git --icons -x permissions,username,date_modified"
alias tree="eza -TL"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thanuj/google-cloud-sdk/path.fish.inc' ]
    . '/Users/thanuj/google-cloud-sdk/path.fish.inc'
end

set -x DENO_INSTALL $HOME/.deno
fish_add_path $HOME/.deno
fish_add_path $DENO_INSTALL/bin
