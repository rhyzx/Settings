#!/bin/sh

for name in `git branch -r --merged HEAD~`; do
    echo git push ${name%%/*} :${name#*/}
done
