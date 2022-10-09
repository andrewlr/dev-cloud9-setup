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


if [[ -z "${GITHUB_TOKEN}" ]]; then
    printf "Enter GitHub Personal Access Token: "
    read READ_GITHUB_TOKEN
    export GITHUB_TOKEN="$READ_GITHUB_TOKEN"
else
    printf "\nGitHub Personal Access Token: Using Environment Variable GITHUB_TOKEN value %s" "$GITHUB_TOKEN"
fi


# Applying GitHub Configuration
printf "\n\n\n### Apply GitHub Configuration ###"

git config --global user.name "$GITHUB_NAME"
git config --global user.email "$GITHUB_EMAIL"
git config -l

git config --system credential.helper
git config --system --unset credential.helper
git fetch upstream


