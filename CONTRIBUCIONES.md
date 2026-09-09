# Contribuciones del equipo

Este registro reconstruye el trabajo **realmente realizado** por el equipo durante la implementación de Nodo Sur. No se asignan tareas ficticias ni commits retroactivos. Como el repositorio se consolidó al final del hito, no todas las contribuciones quedaron asociadas a commits individuales; por eso se indican también otras evidencias disponibles.

| Integrante | Trabajo realizado | Evidencia disponible |
|---|---|---|
| **Camilo Durán** | Integración y cierre técnico de la plataforma; configuración y validación de la arquitectura distribuida final; DNS autoritativo en `.59`; migración y validación de MariaDB separada en `.60`; configuración/validación de Apache, HTTPS y PHP-FPM en `.58`; hardening SSH/UFW; cuentas nominativas; almacenamiento LVM para uploads; actualización de VMs; logs/observabilidad; sudo limitado por rol; validaciones finales y consolidación del repositorio/documentación. | Configuraciones y pruebas de `configs/`, `pruebas/`, `ARQUITECTURA.md`, `BITACORA.md`, `CHECKLIST_ENTREGA2.md` y validaciones ejecutadas en las tres VMs. |
| **Nicolás Matamala** | Apoyo en pruebas funcionales y técnicas; apoyo en WordPress y WooCommerce; elaboración de un borrador de informe técnico y bitácora de implementación utilizado como insumo para consolidar la documentación final. | Borrador técnico/bitácora entregado al equipo; pruebas realizadas sobre el CMS y WooCommerce; participación en validaciones del flujo funcional. |
| **Joaquín Sáez** | Instalación y configuración de WordPress; trabajo en el diseño del sitio; incorporación/configuración de WooCommerce y apoyo en la preparación visual/funcional de la tienda. | Resultado visible en el sitio WordPress/WooCommerce y declaración directa del integrante al equipo. No generó documentación propia de sus cambios. |
| **Jean Díaz** | Elaboración de un mockup exploratorio de interfaz durante una etapa temprana del proyecto. | Aporte de diseño exploratorio declarado por el equipo. El mockup no fue incorporado a la versión final de la plataforma, por lo que no se presenta como cambio técnico implementado. |

## Criterio de registro

- Las contribuciones se describen según lo que cada integrante efectivamente realizó.
- No se atribuyen commits a integrantes que no los realizaron desde su propia cuenta.
- Los aportes que no llegaron a producción se identifican explícitamente como exploratorios o no incorporados.
- La consolidación final del repositorio se realizó al cierre del hito, por lo que el historial de Git no representa por sí solo toda la distribución del trabajo del equipo.

## Nota sobre verificabilidad

Para la revisión del hito, las contribuciones técnicas se contrastan principalmente con el estado funcional de las VMs, WordPress/WooCommerce, las pruebas ejecutadas y los documentos entregados durante el trabajo. Si se conserva el mockup original de Jean, puede mantenerse como evidencia adicional fuera del entorno productivo o incorporarse posteriormente en una carpeta documental, sin declararlo como parte de la implementación final.
