# Nodo Sur — Taller de Administración de Sistemas

Proyecto académico del **Grupo 7** para el Taller de Administración de Sistemas, USM, segundo semestre 2026.

## Estado actual

Arquitectura distribuida validada para la entrega:

- **VM .59 — DNS autoritativo / BIND9**
  - Administración/laboratorio: `10.33.195.205`
  - Red interna: `10.33.199.59`
  - Zona: `nodosur07.tas`
- **VM .58 — Web/CMS**
  - Administración/laboratorio: `10.33.195.202`
  - Red interna: `10.33.199.58`
  - Apache + PHP-FPM + WordPress + WooCommerce
- **VM .60 — Base de datos**
  - Administración/SSH: `10.33.195.226`
  - Red interna: `10.33.199.60`
  - MariaDB escucha en `10.33.199.60:3306`

Flujo principal:

`Cliente → DNS .59 → Web .58 → MariaDB .60`

## Controles implementados

- DNS autoritativo para `nodosur07.tas`.
- HTTP redirigido a HTTPS.
- Certificado TLS autofirmado para laboratorio.
- MariaDB separada de la VM web.
- Almacenamiento LVM dedicado para `wp-content/uploads` en la VM .58.
- UFW con accesos por origen y rol.
- SSH restringido a redes VPN/laboratorio y a miembros de `ssh-nodosur`.
- `PermitRootLogin no`.
- Cuentas nominativas para los integrantes del equipo.
- Logs y pruebas reproducibles para web, DNS, SSH y MariaDB.
- VMs actualizadas y validadas después del mantenimiento.

## Redes relevantes

- VPN USM: `10.30.248.0/24`
- Laboratorio: `10.33.21.0/24`
- Red interna Grupo 7: `10.33.199.56/29`

## Estructura del repositorio

- `configs/`: ejemplos saneados de configuración.
- `scripts/`: validaciones no destructivas.
- `pruebas/`: procedimientos reproducibles y resultados esperados.
- `evidencias/`: guía para capturas/logs de evidencia.
- `docs/`: decisiones de arquitectura.
- `BITACORA.md`: incidentes técnicos reales y su resolución.
- `CONTRIBUCIONES.md`: registro verificable de trabajo por integrante.
- `CHECKLIST_ENTREGA2.md`: estado consolidado y pendientes antes de entregar.

## Seguridad

**Este repositorio no debe contener credenciales, contraseñas, salts, claves privadas, dumps con datos sensibles ni archivos `wp-config.php` reales.**

Las configuraciones incluidas están saneadas y usan placeholders cuando corresponde.

## Acceso de revisión

La cuenta temporal de revisión docente y sus credenciales se documentan **fuera del repositorio**. No se almacenan secretos aquí.

## Validación rápida

Los scripts se almacenan como archivos de texto reproducibles. Pueden ejecutarse explícitamente con Bash:

```bash
bash scripts/validate-web.sh
bash scripts/validate-dns.sh
```

En los servidores correspondientes también están disponibles:

```bash
bash scripts/validate-db-local.sh
bash scripts/validate-ssh-config.sh
```

Las pruebas de DB/SSH requieren ejecutarse desde hosts/redes autorizadas y están documentadas en `pruebas/`.

## Pendientes de cierre

El estado exacto está en `CHECKLIST_ENTREGA2.md`. No se declara como finalizado el **flujo empresarial WooCommerce** ni la **tabla de contribuciones por integrante** hasta incorporar evidencia real del equipo.
