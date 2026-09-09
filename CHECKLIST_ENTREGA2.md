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
| Almacenamiento persistente | Validado | `pruebas/almacenamiento.md` |
| Logs/observabilidad | Validado | `pruebas/logs-observabilidad.md` |
| VMs actualizadas | Validado | `pruebas/actualizaciones.md` |
| Bitácora de incidentes | Documentada | `BITACORA.md` |
| Manejo de secretos | Documentado | `SECURITY.md`, `.gitignore` |
| Flujo empresarial WooCommerce | **Validado** | pedido `#71` correlacionado cliente → admin → MariaDB, `pruebas/flujo-woocommerce.md` |
| Contribuciones verificables por integrante | **Pendiente de completar** | `CONTRIBUCIONES.md` |
| Defensa individual | **Pendiente de preparación** | documentación del repositorio |

## Pendientes reales de cierre

1. **Contribuciones:** asignar únicamente tareas reales y, cuando sea posible, asociarlas a commits/evidencias.
2. **Defensa:** preparar explicación individual de arquitectura, decisiones, diagnóstico y validaciones.
3. **Sudo:** los cuatro integrantes cumplen rol administrativo y actualmente tienen privilegios equivalentes. Si la rúbrica exige literalmente sudo restringido por comandos, documentar la justificación o revisar con el profesor antes de cambiar una configuración funcional.
4. **SPOF:** la arquitectura actual mantiene un único DNS, web y DB por rol. No declarar HAProxy/NFS/segundo backend como implementados.
5. **Publicación del repositorio:** antes de hacerlo público, realizar una última revisión de secretos y datos innecesarios.
