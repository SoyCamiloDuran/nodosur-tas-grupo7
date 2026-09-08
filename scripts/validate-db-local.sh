#!/usr/bin/env bash
set -u

printf '== Nodo Sur: validación local MariaDB (.60) ==\n'

systemctl is-active mariadb
systemctl is-enabled mariadb

printf '\nListener 3306:\n'
sudo ss -lntp | grep ':3306' || true

printf '\nVersión MariaDB:\n'
sudo mariadb -Nse 'SELECT VERSION();'

printf '\nBase principal y cantidad de tablas:\n'
sudo mariadb -Nse "SELECT SCHEMA_NAME FROM information_schema.SCHEMATA WHERE SCHEMA_NAME='nodo_sur_final';"
sudo mariadb -Nse "SELECT COUNT(*) FROM information_schema.TABLES WHERE TABLE_SCHEMA='nodo_sur_final';"
