#!/bin/bash

#build project

# add content changes
git add content

# commit
msg="Updating content `date`"
if [ $# -eq 1 ]
    then msg="$1"
fi
git commit -m "$msg"

## Push to fork
git push origin master
