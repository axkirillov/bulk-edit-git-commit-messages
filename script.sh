#!/bin/bash

branch=$(git branch --show-current)

ticket=$(echo "${branch}" | awk -F "-" '{print $1 "-" $2}')

sha=$(git log --oneline | fzf | awk '{print $1}')

git filter-branch -f --msg-filter "echo \"[$ticket] \$(cat)\"" "$sha"..HEAD
