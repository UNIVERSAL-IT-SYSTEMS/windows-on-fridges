#!/bin/bash

# build site and deploy to gh-pages

hugo

git add -A

msg="Rebuilding site `date`"
if [ $# -eq 1  ]
    then msg="$1"
fi
git commit -m "$msg"

# Subtree for gh-pages
git subtree split --prefix public -b gh-pages
git push -f origin gh-pages:gh-pages
git branch -D gh-pages
