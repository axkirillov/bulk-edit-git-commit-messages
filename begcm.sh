#!/usr/bin/env bash


ticket=$(echo "$(git branch --show-current)" | awk -F'-' '{print "["$1"-"$2"]"}')
sha=$(git log --oneline | fzf --reverse --header='Select a commit' | awk '{print $1}')

git filter-branch -f --msg-filter "s/^/$ticket/" "$sha"..HEAD
