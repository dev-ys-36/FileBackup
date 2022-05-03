#!/bin/bash

_PATH="/root/security"

PKGS="zip"
PKGS_INSTALLED=false
TIME=`date +[%Y-%m-%d-%H-%M]`
BACKUP_PATH=`pwd -P`"/backup"

if dpkg -s $PKGS >/dev/null 2>&1; then
    echo "$TIME Package zip is installed!.."
    PKGS_INSTALLED=true
else
    echo "$TIME Package zip is not installed!.."
    echo "$TIME Download Pakage zip!.."
    apt-get install $PKGS -y
    PKGS_INSTALLED=true
fi

if [[ ! -e $BACKUP_PATH ]]; then
    echo "$TIME Create Backup Folder!.."
    mkdir $BACKUP_PATH
fi

while "$PKGS_INSTALLED" == true; do
    zip -r $BACKUP_PATH"/"$TIME".zip" $_PATH
    sleep 60
done