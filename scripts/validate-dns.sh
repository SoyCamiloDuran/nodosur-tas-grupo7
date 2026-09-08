#!/usr/bin/env bash
set -u

DNS_SERVER="10.33.195.205"
ZONE="nodosur07.tas"

printf '== Nodo Sur: validación DNS ==\n'
printf 'Servidor: %s\n\n' "$DNS_SERVER"

for name in "$ZONE" "www.$ZONE" "db.$ZONE" "ns1.$ZONE"; do
  printf '%-25s -> ' "$name"
  dig @"$DNS_SERVER" "$name" A +short
 done

printf '\nPrueba TCP para apex:\n'
dig @"$DNS_SERVER" "$ZONE" A +tcp +short
