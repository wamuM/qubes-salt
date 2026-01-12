export DIR="${SPLIT_GIT_HOME:-"/home/user/split_git/"}";
cd "$DIR/qubes-config.git";
export GIT_SSH_COMMAND="ssh -i /home/user/QubesIncoming/dom0/github-token -o StrictHostKeyChecking=no -o IdentitiesOnly=yes";
yes | git push --force git@github.com:wamuM/qubes-salt master;
