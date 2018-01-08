#!/usr/bin/env bash

export NAME
export EMAIL

BIN_NAME=$(basename "$0")

sub_printUsage() {
    echo "Usage: $BIN_NAME -n <Name to use in .gitconfig> -e <Email to use in .gitconfig>"
}

while getopts n:e: option
do
    case "${option}"
    in
    n) NAME=${OPTARG};;
    e) EMAIL=${OPTARG};;
    esac
done

echo "EMAIL: ${EMAIL}"
echo "NAME: ${NAME}"

if [[ -z "$NAME" && -z "$EMAIL" ]];
then
    echo "Missing name and email to set for .gitconfig!"
    sub_printUsage
    exit 1
fi

if [ -z "$NAME" ];
then
    echo "Missing name to set for .gitconfig!"
    sub_printUsage
    exit 1
fi

if [ -z "$EMAIL" ];
then
    echo "Missing email to set for .gitconfig!"
    sub_printUsage
    exit 1
fi

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Common functions

. "$DOTFILES_DIR/system/.function"
. "$DOTFILES_DIR/system/.function_network"

# Update dotfiles itself first

if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Update .gitconfig with command line 

sed -i "s/NAME_HERE/${NAME}/g" "$DOTFILES_DIR/git/.gitconfig"
sed -i "s/EMAIL_HERE/${EMAIL}/g" "$DOTFILES_DIR/git/.gitconfig"

# Setup symlinks

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/git/.git-prompt-colors.sh" ~

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"
. "$DOTFILES_DIR/install/port.sh"
. "$DOTFILES_DIR/install/npm.sh"
. "$DOTFILES_DIR/install/bash.sh"
. "$DOTFILES_DIR/install/gem.sh"
. "$DOTFILES_DIR/install/mas.sh"