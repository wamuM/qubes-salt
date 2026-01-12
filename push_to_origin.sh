#!/bin/env bash

VM="temp-git"
REPO="qubes-config"

echo "[#] creating $VM VM"

if qvm-check $VM >/dev/nul; then
   echo "[!] Fatal: the VM already exists"	
else
   qvm-create $VM --template template-coding --label purple
   echo "[+] $VM succesfully created"
fi
echo "[+] Starting VM"
qvm-start $VM
echo "[+] Creating VM repo"
qvm-run --service $VM splitGit.Init+$REPO

echo "[+] Pushing to VM repo"
git push "qrexec://$VM/$REPO" HEAD:master

echo "[+] Copying token to VM"
qvm-copy-to-vm "$VM" "/srv/github-token"

echo "[+] Pushing to remote"
qvm-run "$VM" --pass-io ' 
DIR="${SPLIT_GIT_HOME:-"$HOME/split_git/"}"
cd "$DIR/qubes-config.git"
GIT_SSH_COMMAND="ssh -i $HOME/QubesIncoming/dom0/github-token -o IdentitiesOnly=yes"
yes | git push git@github.com:wamuM/qubes-salt master 
'
