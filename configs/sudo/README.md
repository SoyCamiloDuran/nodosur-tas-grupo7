# Política sudo limitada por rol

Este directorio documenta la política operativa aplicada a las tres VMs de Nodo Sur.

## Principio

Las cuentas nominativas del equipo (`cduran`, `nmatamala`, `jsaez`, `jdiaz`) comparten el grupo `nodosur-ops` y no pertenecen al grupo `sudo`. Cada VM autoriza solo los comandos necesarios para operar su servicio principal.

Los integrantes también pertenecen a `systemd-journal` para consultar logs sin entregar root irrestricto.

## Cuentas de recuperación

Cada servidor conserva una cuenta bootstrap/recovery con sudo completo:

- `.58 WEB`: `tas_07`
- `.59 DNS`: `nodosur-g7`
- `.60 DB`: `svr-db-nodosur07`

Estas cuentas se reservan para contingencias y cambios excepcionales.

## Revisión docente

`tas_revision` es una cuenta temporal de evaluación con sudo completo en las tres VMs. Sus credenciales se entregan fuera de GitHub y deben revocarse al finalizar la evaluación.

## Archivos

- `web.sudoers.example`: operaciones Apache/PHP-FPM/UFW lectura.
- `dns.sudoers.example`: operaciones BIND/rndc/UFW lectura.
- `db.sudoers.example`: operaciones MariaDB de servicio, script de comprobación y UFW lectura.

Estos archivos no contienen contraseñas ni secretos.
