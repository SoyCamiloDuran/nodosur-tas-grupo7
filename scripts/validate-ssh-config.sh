#!/usr/bin/env bash
set -u

printf '== Nodo Sur: validación SSH local ==\n'

sudo sshd -t
sudo sshd -T | grep -E 'permitrootlogin|pubkeyauthentication|passwordauthentication|kbdinteractiveauthentication|allowgroups'

printf '\nGrupo autorizado:\n'
getent group ssh-nodosur

printf '\nGrupo sudo:\n'
getent group sudo
