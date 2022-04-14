#!/bin/bash

BASEDIR=$(dirname $0)

echo 'Copying config files to the repository...'
cp ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile ~/.gitconfig ~/.vimrc $BASEDIR
echo 'Copying config files to the repository done.'

read -p "Push To Github (y/n)?" choice

push_to_repository(){

    read -p "Your commit message : " message

    if [ -z "$message" ]
    then
        commit_msg="updated config file $(date '+%Y-%m-%d'). "
    else
        commit_msg="$message"
    fi

    echo 'Committing config files...'
    git add .
    git commit -m "$commit_msg"
    echo 'Committing config files done.'

    echo 'Pushing config files...'
    git push origin main
    echo 'Pushing config files done.'
}

case "$choice" in 
  y|Y ) push_to_repository;;
  n|N ) exit;;
  * ) echo "invalid";;
esac


