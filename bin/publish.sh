#!/usr/bin/env bash

# git push github
git remote | xargs -L1 git push --all
npm publish

#RELAY="ws://nostr.rocks:1617"
RELAY=$(git config gitmark.relay)
GENESIS="gitmark:bdc0528dd88bd0dac229e62f5cf92064e1cd6705f5f0bcce26bfbe4ebcf122a8:0"
CREATED=1657404285


git-mark-list $(git config gitmark.secret) --genesis "${GENESIS}" --created "${CREATED}" -g $(cat package.json | jq -r '.repository.url')  | websocat $RELAY
