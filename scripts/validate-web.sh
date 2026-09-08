#!/usr/bin/env bash
set -u

BASE_URL="https://nodosur07.tas"

printf '== Nodo Sur: validación WEB ==\n'

for path in / /tienda/ /carrito/ /mi-cuenta/; do
  code=$(curl -k -sS -o /dev/null -w '%{http_code}' "${BASE_URL}${path}")
  printf '%-20s HTTP %s\n' "$path" "$code"
done

printf '\nResolución actual:\n'
getent hosts nodosur07.tas || true
