#!/bin/bash

BASEDIR=$(dirname $0)

echo 'Copying config files to the repository...'
cp ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile $BASEDIR
echo 'Copying config files to the repository done.'

commit_msg="updated config file $(date '+%Y-%m-%d'). "

echo 'Committing config files...'
git add .
git commit -m "$commit_msg"
echo 'Committing config files done.'


echo 'Pushing config files...'
git push origin main
echo 'Pushing config files done.'