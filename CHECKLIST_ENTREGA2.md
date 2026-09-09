# Checklist Entrega 2

Estado técnico consolidado del repositorio. No reemplaza la rúbrica oficial.

| Área | Estado | Evidencia principal |
|---|---|---|
| Inventario y arquitectura | Validado | `INVENTARIO.md`, `ARQUITECTURA.md` |
| DNS autoritativo | Validado | `configs/dns/`, `pruebas/dns.md` |
| Web HTTP/HTTPS | Validado | `configs/apache/`, `pruebas/web-https.md` |
| PHP-FPM | Validado | `pruebas/web-https.md`, logs de servicio |
| WordPress/WooCommerce | Validado | sitio, tienda y pedido real de prueba |
| MariaDB separada | Validado | `configs/mariadb/`, `pruebas/base-datos.md` |
| Firewall UFW | Validado | `configs/firewall/README.md` |
| SSH nominativo/hardening | Validado | `configs/ssh/`, `pruebas/ssh-firewall.md` |
| Sudo limitado por rol | **Validado** | `configs/sudo/`, `pruebas/ssh-firewall.md` |
| Cuenta temporal de revisión docente | **Validado** | `tas_revision` con sudo completo en las 3 VMs; credenciales fuera del repo |
| Almacenamiento persistente | Validado | `pruebas/almacenamiento.md` |
| Logs/observabilidad | Validado | `pruebas/logs-observabilidad.md` |
| VMs actualizadas | Validado | `pruebas/actualizaciones.md` |
| Bitácora de incidentes | Documentada | `BITACORA.md` |
| Manejo de secretos | Documentado | `SECURITY.md`, `.gitignore` |
| Flujo empresarial WooCommerce | **Validado** | pedido `#71` correlacionado cliente → admin → MariaDB, `pruebas/flujo-woocommerce.md` |
| Contribuciones verificables por integrante | **Pendiente de completar** | `CONTRIBUCIONES.md` |
| Defensa individual | **Pendiente de preparación** | documentación del repositorio |

## Estado de privilegios administrativos

Las cuentas nominativas del equipo (`cduran`, `nmatamala`, `jsaez`, `jdiaz`) ya no pertenecen al grupo `sudo`. Todas comparten el grupo operativo `nodosur-ops` y disponen únicamente de comandos sudo acordes al rol del servidor:

- `.58 WEB`: Apache, PHP-FPM y consulta de UFW.
- `.59 DNS`: BIND/rndc, validación de zona y consulta de UFW.
- `.60 DB`: gestión del servicio MariaDB, comprobación mediante script fijo y consulta de UFW.

Los integrantes pueden leer el journal de servicios mediante `systemd-journal`. Las pruebas negativas `sudo /bin/bash` fueron rechazadas en las tres VMs; en `.60` también se confirmó que `sudo /usr/bin/mariadb` está bloquequeado para las cuentas operativas.

Cada VM conserva una cuenta bootstrap/recovery con sudo completo:

- `.58`: `tas_07`
- `.59`: `nodosur-g7`
- `.60`: `svr-db-nodosur07`

La cuenta `tas_revision` es temporal para revisión docente y posee sudo completo en las tres VMs. Su contraseña se mantiene fuera del repositorio y debe revocarse al finalizar la evaluación.

## Pendientes reales de cierre

1. **Contribuciones:** completar únicamente tareas reales por integrante; no inventar reparto retrospectivo.
2. **Defensa:** preparar explicación individual de arquitectura, decisiones, diagnóstico y validaciones.
3. **SPOF:** la arquitectura actual mantiene un único DNS, web y DB por rol. No declarar HAProxy/NFS/segundo backend como implementados.
4. **Publicación del repositorio:** antes de hacerlo público, realizar una última revisión de secretos, datos personales y consistencia documental.
