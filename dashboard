#!/bin/bash

# --- Setup ---
# Sets the $client variable
# 1.) Check for `-c clientName` argument
# 2.) Check current working directory, will use this client if not specified
# 3.) Bring up fzf with a list of clients to choose from

clientsDir="/sv/clients"

while getopts c: flag
do
  case "${flag}" in
    c) client=${OPTARG};;
  esac
done

if [[ -z "$client" ]]; then
  if [[ "$PWD" =~ "$clientsDir" ]]; then
    IFS="/" read -a dirs <<< $(pwd)
    trigger=false
    for i in "${dirs[@]}"; do
      if [[ $trigger = true ]]; then
        client="$i"
        break
      fi
      if [[ $i = "clients" ]]; then
        trigger=true
      fi
    done
  fi
fi

if [[ -z "$client" ]]; then
  client=$(ls "$clientsDir" | fzf)
fi
# -------------

function main(){
  search="$(awk -F: '/run/&& NR>5{print $2}' "$0" | fzf )"
  cmd="$(awk -v s="$search" '$0~s {getline; print $2}' "$0" | cut -d\( -f1 )"
  $cmd
  exit 0
}

# run:Git Stage
function git_stage() {
  echo "Staging files for $client ..."
}

# run:Git Reset
function git_reset() {
    echo "Reseting files for $client ..."
}

# run:Downsync Live
function downsync_live(){
  echo "Getting live db for $client ..."
}

# run:Downsync Staging
function downsync_live(){
  echo "Getting live db for $client ..."
}

# run:Backup
function backup() {
    echo "Starting database backup for $client ..."
}

# run:Commit
function commit() {
    echo "Starting SVN commit for $client ..."
}

# run:Deploy Live
function deploy_live() {
    echo "Starting deploy to live for $client ..."
}

# run:Deploy Staging
function deploy_staging() {
    echo "Starting deploy to staging for $client ..."
}

main
