#-- Configure .bashrc and/or .zshrc
#-- To configure another file, provide it using PROFILE_FILE environment variable
#--     PROFILE_FILE=~/.profile $SCRIPT_NAME

echo "
    source $SCRIPT_DIR/path/nvm
    source $SCRIPT_DIR/path/devenv
    source $SCRIPT_DIR/path/sdkman
"
