# Prueba reproducible — Base de datos separada

## Objetivo

Comprobar que MariaDB productiva reside en `.60`, escucha por la red interna y que la VM web puede alcanzarla sin exponer credenciales en el repositorio.

## En VM .60

```bash
systemctl is-active mariadb
systemctl is-enabled mariadb
sudo ss -lntp | grep ':3306'
sudo mariadb -e 'SELECT VERSION();'
```

Resultado esperado: MariaDB activo/habilitado y listener en `10.33.199.60:3306`.

## Base productiva

```bash
sudo mariadb
```

```sql
USE nodo_sur_final;
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema='nodo_sur_final';
EXIT;
```

Estado validado: la base `nodo_sur_final` contiene 52 tablas.

## Prueba negativa controlada desde .58

Se utiliza un usuario inexistente y una contraseña ficticia; **no se emplean credenciales reales**.

```bash
mariadb \
-h db.nodosur07.tas \
-u evidencia_tas \
-p'NO_ES_UNA_PASSWORD_REAL' \
-e 'SELECT 1;'
```

Resultado esperado: `Access denied`.

En `.60`:

```bash
sudo journalctl -u mariadb --since '2 minutes ago' --no-pager \
| grep -i 'Access denied'
```

Resultado validado el 08-09-2026: MariaDB registró el rechazo para `evidencia_tas` desde `10.33.199.58`.

## Interpretación

La prueba negativa demuestra simultáneamente que `.58` alcanza `.60:3306`, MariaDB recibe la conexión, aplica autenticación y registra el rechazo. No demuestra permisos del usuario real de aplicación; esos se validan por separado sin publicar su contraseña.
