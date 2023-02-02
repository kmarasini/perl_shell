#!/bin/bash
# Add general configurations, job configurations, and user content
cd $JEnkins_HOME
git add -- *.xml jobs/*/*.xml userContent/* ansible/*
# only add user configuration if theyt exist

if [ -d users ]; then
     user_fonfiges=`ls users/*/config.xml`
     if [ -n "$user_configs"]; then
            git add $user_configs
    fi
fi
# Mark as deleeted anythign that's been. well, deleted
to_move=`git status | grep "Deleted" | awk '{print $3}'`
if [ -n "$to_move" ]; then
        git rm --ignore-unmatch $to_move
fi
git commit -m "Automated Jenkins commit"
git push -q -u origin master

# Step6 As the linux user jenkins go to the directory /var/lib/jenkins and initiate a new git repository.
#jenkins@jenkins-vm cd /var/lib/jenkins && git init
#Step 7. Connect your local repository to GitHub.
#$ git remote add origin git@github.com:username/new_repo