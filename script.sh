#!/bin/bash

branch=$(git branch --show-current)

echo $branch

ticket=$(echo "${branch}" | awk -F "-" '{print $1 "-" $2}')

echo $ticket

git filter-branch -f --msg-filter "echo \"{$ticket} $(cat)\"" HEAD~1..HEAD
