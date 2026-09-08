# Prueba reproducible — SSH y firewall

## Objetivo

Comprobar que el acceso administrativo es nominativo, que root no entra directamente por SSH y que UFW restringe el puerto 22 a VPN/laboratorio.

## Configuración efectiva

En cada VM:

```bash
sudo sshd -t
sudo sshd -T | grep -E \
'permitrootlogin|pubkeyauthentication|passwordauthentication|kbdinteractiveauthentication|allowgroups'
```

Estado esperado:

```text
permitrootlogin no
pubkeyauthentication yes
passwordauthentication yes
kbdinteractiveauthentication no
allowgroups ssh-nodosur
```

## Identidades

```bash
getent group ssh-nodosur
getent group sudo
```

Cuentas nominativas del equipo:

- `cduran`
- `nmatamala`
- `jsaez`
- `jdiaz`

La cuenta `tas_revision` se mantiene separada como cuenta temporal de revisión docente.

## Firewall

```bash
sudo ufw status numbered
```

El puerto 22 debe estar permitido desde:

- VPN `10.30.248.0/24`.
- Laboratorio `10.33.21.0/24`.

No debe existir una regla `OpenSSH Anywhere`.

## Evidencia de AllowGroups

Durante la implementación en `.59`, `cduran` fue rechazado cuando aún no pertenecía a `ssh-nodosur`. El journal registró:

```text
User cduran ... not allowed because none of user's groups are listed in AllowGroups
```

Después de agregarlo al grupo, el acceso quedó registrado como aceptado.

Consultar:

```bash
sudo journalctl -u ssh -n 50 --no-pager
```

Esto demuestra que `AllowGroups` participa realmente en la autorización del acceso.
