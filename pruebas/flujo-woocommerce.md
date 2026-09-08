# Flujo empresarial WooCommerce — pendiente de evidencia final

## Objetivo

Demostrar una transacción identificable de extremo a extremo en la aplicación y posteriormente localizar el mismo registro en la base de datos.

## Procedimiento

1. Crear o usar una cuenta de **cliente** de WooCommerce, no administrador.
2. Iniciar sesión en `/mi-cuenta/`.
3. Seleccionar un producto/taller identificable.
4. Registrar nombre, precio y stock/cupo previo si corresponde.
5. Agregar al carrito.
6. Verificar producto, cantidad y total.
7. Ir a finalizar compra y completar los datos requeridos.
8. Usar únicamente un método de prueba/no real habilitado para la actividad.
9. Finalizar el pedido.
10. Registrar el ID del pedido, fecha/hora, cliente, total y estado.
11. Verificar el pedido desde **Mi cuenta → Pedidos**.
12. Verificar el mismo ID desde **WooCommerce → Pedidos**.
13. Localizar el registro correspondiente en MariaDB `.60`.

## Evidencias a completar por el equipo

- ID pedido: `PENDIENTE`
- Cliente: `PENDIENTE`
- Producto/taller: `PENDIENTE`
- Total/estado: `PENDIENTE`
- Captura cliente: `PENDIENTE`
- Captura administración WooCommerce: `PENDIENTE`
- Consulta/resultado DB: `PENDIENTE`

> Este archivo no declara el flujo como validado hasta que el equipo incorpore una transacción real de prueba y su evidencia.
