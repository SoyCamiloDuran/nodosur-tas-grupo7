# Prueba reproducible — Web y HTTPS

## Objetivo

Comprobar resolución, redirección HTTP→HTTPS, respuesta de la aplicación y trazabilidad en logs.

## Desde cliente VPN/laboratorio

```bash
curl -I --connect-timeout 5 http://nodosur07.tas/
curl -kI --connect-timeout 5 https://nodosur07.tas/
curl -kI --connect-timeout 5 https://nodosur07.tas/tienda/
```

Resultados esperados:

- HTTP devuelve redirección permanente hacia HTTPS.
- HTTPS `/` responde HTTP 200.
- HTTPS `/tienda/` responde HTTP 200.

## Evento identificable para evidencia

```bash
curl -k -sS -o /dev/null -w 'HTTP %{http_code}\n' \
'https://nodosur07.tas/tienda/?evidencia=tas-20260908'
```

En `.58`:

```bash
sudo grep 'evidencia=tas-20260908' /var/log/apache2/nodosur_ssl_access.log
```

Resultado validado el 08-09-2026: petición desde VPN registrada con `GET /tienda/?evidencia=tas-20260908` y HTTP 200.

## Diagnóstico

```bash
sudo apache2ctl configtest
systemctl is-active apache2
systemctl is-active php8.3-fpm
sudo tail -n 50 /var/log/apache2/nodosur_ssl_error.log
```
