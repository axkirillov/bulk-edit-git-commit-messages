#!/bin/bash

git filter-branch --msg-filter 'echo "[JQ-123] $(cat)"' HEAD~1..HEAD
