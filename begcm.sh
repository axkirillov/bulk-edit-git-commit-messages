#!/usr/bin/env bash

git commit -a -m "you forgot to commit this"

ticket=$(echo "$(git branch --show-current)" | awk -F'-' '{print "["$1"-"$2"]"}')
sha=$(git log --oneline | fzf --reverse --header='Select a commit' | awk '{print $1}')

git filter-repo -f --message-callback "return b\"$ticket \" + message" --refs "$sha"..HEAD
