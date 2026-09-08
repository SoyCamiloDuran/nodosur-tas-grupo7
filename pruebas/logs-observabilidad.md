# Prueba reproducible — Logs y observabilidad

## Objetivo

Demostrar que los servicios críticos generan registros útiles y que es posible correlacionar un evento con su log.

## Apache HTTPS (.58)

Generar un evento identificable desde cliente:

```bash
curl -k -sS -o /dev/null -w 'HTTP %{http_code}\n' \
'https://nodosur07.tas/tienda/?evidencia=tas-20260908'
```

Buscarlo:

```bash
sudo grep 'evidencia=tas-20260908' /var/log/apache2/nodosur_ssl_access.log
```

Resultado validado: HTTP 200 y registro de la petición desde la VPN.

## SSH

```bash
sudo journalctl -u ssh -n 50 --no-pager
```

Los logs contienen accesos aceptados y rechazados, usuario, IP origen y apertura de sesión.

## BIND9 (.59)

```bash
sudo rndc querylog on
```

Desde cliente:

```bash
dig @10.33.195.205 db.nodosur07.tas A +short
```

Luego:

```bash
sudo journalctl -u named --since '2 minutes ago' --no-pager
sudo rndc querylog off
```

Resultado validado: consulta A por `db.nodosur07.tas` registrada desde el cliente VPN.

## MariaDB (.60)

Desde `.58`, prueba negativa controlada:

```bash
mariadb -h db.nodosur07.tas -u evidencia_tas \
-p'NO_ES_UNA_PASSWORD_REAL' -e 'SELECT 1;'
```

En `.60`:

```bash
sudo journalctl -u mariadb --since '2 minutes ago' --no-pager \
| grep -i 'Access denied'
```

Resultado validado: rechazo de `evidencia_tas` desde `10.33.199.58` registrado por MariaDB.

## Criterio

Las pruebas se diseñan para ser no destructivas y no exponer contraseñas reales. El query logging de DNS se desactiva tras la prueba para no generar ruido permanente.
