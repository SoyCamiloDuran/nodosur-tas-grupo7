# Política de manejo de secretos

No subir al repositorio:

- Contraseñas de cuentas Linux, WordPress o MariaDB.
- Contraseña del usuario de aplicación.
- `wp-config.php` real.
- Salts de WordPress.
- Claves privadas TLS/SSH.
- Credenciales VPN/iLab/Proxmox.
- Dumps SQL sin sanear.
- Tokens o cookies de sesión.

Las configuraciones públicas deben usar placeholders como `<REDACTED>` o variables de ejemplo.
