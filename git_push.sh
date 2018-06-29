!#/bin/bash
sudo apt-get install git
echo -n "please enter your git email"
read gemail
git config --global user.email $gemail

echo -n "please enter your git name"
read guname
git config --global user.name $guname

git pull
git status
git add .
git status
git commit -m "changes by grenwell"
git push origin master
