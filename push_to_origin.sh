#!/bin/env bash

VM="temp-git-$$"
REPO="qubes-config"

echo "[#] creating $VM VM"

if qvm-check $VM >/dev/nul; then
   echo "[!] Fatal: the VM already exists"	
   exit 1
else
   qvm-create $VM --template template-coding --label purple
   echo "[+] $VM succesfully created"
fi
echo "[+] Starting VM"
qvm-start $VM
echo "[+] Creating VM repo"
qvm-run --service $VM splitGit.Init+$REPO

echo "[+] Copying token to VM"
qvm-copy-to-vm "$VM" "/srv/github-token"

echo "[+] Copying push script to VM"
qvm-copy-to-vm "$VM" "/srv/push_from_vm.sh"
qvm-run "$VM" "chmod a+x /home/user/QubesIncoming/dom0/push_from_vm.sh"

echo "[+] Pushing to VM repo"
git push "qrexec://$VM/$REPO" HEAD:master

echo "[+] Pushing to remote"
qvm-run "$VM" "/home/user/QubesIncoming/dom0/push_from_vm.sh"

echo "[+] Removing $VM VM"
qvm-shutdown "$VM"
qvm-remove "$VM"
