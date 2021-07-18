#!/bin/bash

clientsDir="/sv/clients"

function main(){
        if [[ "$(pwd)" =~ /sv/clients/ ]]; then
                search="$(awk -F: '/run/{print $2}' "$0"| grep -v "/run/" | fzf )"
                cmd="$(awk -v s="$search" '$0~s {getline; print $2}' "$0" | cut -d\( -f1 )"
                client="$(pwd | sed 's|/sv/clients/||' | awk -F/ '{print $1}')"
                echo "Running commands for $client..."
                $cmd
        else
                echo "You have been moved to the selected client..."
                client=$(ls "$clientsDir" | fzf )
                search="$(awk -F: '/run/{print $2}' "$0"| grep -v "/run/" | fzf )"
                cmd="$(awk -v s="$search" '$0~s {getline; print $2}' "$0" | cut -d\( -f1 )"
                $cmd
                cd "$clientsDir/$client"
                $SHELL
        fi
  exit 0
}

# run:Git Stage
function git_stage() {
  echo "Staging files... $client"
}

# run:Git Reset
function git_reset() {
    echo "Reseting files...$client"
}

# run:Downsync Live
function downsync_live(){
  echo "Getting live db...$client"
}

# run:Downsync Staging
function downsync_live(){
  echo "Getting live db...$client"
}

# run:Backup
function backup() {
    echo "Starting database backup...$client"
}

# run:Backup
function backup() {
    echo "Starting database backup...$client"
}

# run:Commit
function commit() {
    echo "Starting SVN commit...$client"
}

# run:Deploy Live
function deploy_live() {
    echo "sudo sv deployClient $client live"
}

# run:Deploy Staging
function deploy_staging() {
    echo "Starting deploy to staging...$client"
}
