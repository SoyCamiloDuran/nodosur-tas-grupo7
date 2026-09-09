#!/usr/bin/env bash
set -u

printf '== Nodo Sur: validación local MariaDB (.60) ==\n'

systemctl is-active mariadb
systemctl is-enabled mariadb

printf '\nComprobación operativa autorizada:\n'
sudo /usr/local/sbin/nodosur-db-check

printf '\nNota:\n'
printf '%s\n' 'La inspección interactiva con sudo mariadb se reserva para tas_revision o la cuenta bootstrap/recovery.'
