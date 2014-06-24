#!/bin/bash

# Build project
hugo

# Add changes
git add -A

# Commit
msg="Rebuilding site `date`"
if [ $# -eq 1  ]
    then msg="$1"
fi
git commit -m "$msg"

# Push to master and subtree
git push origin master
git subtree push --prefix=public git@github.com:ms-iot/windows-on-fridges.git gh-pages


