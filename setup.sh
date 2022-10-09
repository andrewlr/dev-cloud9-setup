#!/usr/bin/env bash

printf "#####################################################"
printf "\nConfigure Cloud9 Dev Environment"
printf "\n#####################################################"


# Capture GitHub Configuration
printf "\n\n\n### Configure GitHub ###"

if [[ -z "${GITHUB_NAME}" ]]; then
    printf "\nEnter GitHub Name: "
    read READ_GITHUB_NAME
    export GITHUB_NAME="$READ_GITHUB_NAME"
else
    printf "\nGitHub Name: Using Environment Variable GITHUB_NAME value %s" "$GITHUB_NAME"
fi


if [[ -z "${GITHUB_EMAIL}" ]]; then
    printf "Enter GitHub Email: "
    read READ_GITHUB_EMAIL
    export GITHUB_EMAIL="$READ_GITHUB_EMAIL"
else
    printf "\nGitHub Email: Using Environment Variable GITHUB_EMAIL value %s" "$GITHUB_EMAIL"
fi


# Generate GitHub SSH Key
printf "\n\n\n### Generating or Re-using GitHub SSH Key ###"

FILE=~/.ssh/id_ed25519
if [ -f "$FILE" ]; then
    printf "\n%s already exists.\n\n" $FILE
else
    ssh-keygen -t ed25519 -C "$GITHUB_EMAIL"
fi

printf "\nEnter the following SSH Key into GitHub:\n"
cat ~/.ssh/id_ed25519.pub
