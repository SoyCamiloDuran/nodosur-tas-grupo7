# Checklist Entrega 2

Estado técnico consolidado del repositorio. No reemplaza la rúbrica oficial.

| Área | Estado | Evidencia principal |
|---|---|---|
| Inventario y arquitectura | Validado | `INVENTARIO.md`, `ARQUITECTURA.md` |
| DNS autoritativo | Validado | `configs/dns/`, `pruebas/dns.md` |
| Web HTTP/HTTPS | Validado | `configs/apache/`, `pruebas/web-https.md` |
| PHP-FPM | Validado | `pruebas/web-https.md`, logs de servicio |
| WordPress/WooCommerce | Validado técnicamente | sitio y tienda HTTP 200 |
| MariaDB separada | Validado | `configs/mariadb/`, `pruebas/base-datos.md` |
| Firewall UFW | Validado | `configs/firewall/README.md` |
| SSH nominativo/hardening | Validado | `configs/ssh/`, `pruebas/ssh-firewall.md` |
| Almacenamiento persistente | Validado | `pruebas/almacenamiento.md` |
| Logs/observabilidad | Validado | `pruebas/logs-observabilidad.md` |
| VMs actualizadas | Validado | `pruebas/actualizaciones.md` |
| Bitácora de incidentes | Documentada | `BITACORA.md` |
| Manejo de secretos | Documentado | `SECURITY.md`, `.gitignore` |
| Flujo empresarial WooCommerce | **Pendiente de evidencia del equipo** | `pruebas/flujo-woocommerce.md` |
| Contribuciones verificables por integrante | **Pendiente de completar** | `CONTRIBUCIONES.md` |
| Defensa individual | **Pendiente de preparación** | documentación del repositorio |

## Riesgos/documentación pendiente

1. **Flujo empresarial:** no marcar como finalizado hasta disponer de pedido/reserva real de prueba y correlación con MariaDB.
2. **Contribuciones:** asignar únicamente tareas reales y, cuando sea posible, asociarlas a commits/evidencias.
3. **Sudo:** los cuatro integrantes cumplen rol administrativo y actualmente tienen privilegios equivalentes. Si la rúbrica exige literalmente sudo restringido por comandos, documentar la justificación o revisar con el profesor antes de cambiar una configuración funcional.
4. **SPOF:** la arquitectura actual mantiene un único DNS, web y DB por rol. No declarar HAProxy/NFS/segundo backend como implementados.
