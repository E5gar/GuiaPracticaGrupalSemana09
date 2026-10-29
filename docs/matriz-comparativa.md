# Matriz comparativa PHP vs JSP

Comparación técnica de las dos implementaciones del Sistema de Registro de Contacto.

| Criterio | PHP (XAMPP, Apache) | JSP (Tomcat 10.1) |
|---|---|---|
| Ciclo de vida | Cada petición ejecuta el script desde cero (modelo share-nothing). Apache entrega el archivo al intérprete PHP, que lo ejecuta, responde y libera variables y memoria. Con OPcache el bytecode se reutiliza entre peticiones. | En la primera petición Jasper traduce el `.jsp` a un servlet Java y lo compila. El contenedor crea una sola instancia que atiende las peticiones en hilos distintos, con las fases `jspInit`, `_jspService` y `jspDestroy`. |
| Rendimiento | Arranque rápido por petición y buen desempeño con OPcache. Escala añadiendo procesos o servidores. | La primera petición es más lenta por la compilación. Luego el JIT de la JVM optimiza el código, con buen rendimiento sostenido bajo concurrencia y mayor consumo base de memoria. |
| Despliegue | Se copian los archivos a `htdocs`. No hay compilación ni empaquetado. Apache escucha en el puerto 80 y se configura con `httpd.conf` y `php.ini`. | Se publica una carpeta o un WAR en `webapps`, con `WEB-INF/web.xml` y las librerías en `WEB-INF/lib`. Requiere JDK y escucha en el puerto 8080. Los cambios en un JSP se recompilan solos, y los de `web.xml` requieren recarga. |
| Gestión de estado | `$_SESSION` tras `session_start()`. El identificador viaja en la cookie `PHPSESSID` y los datos se guardan por defecto en archivos del servidor (`session.save_path`). | Objeto implícito `session` (`HttpSession`). El identificador viaja en la cookie `JSESSIONID` y los datos viven en la memoria de la JVM, con ámbitos `request`, `session` y `application` compartidos entre hilos. |
| Plantillas y sintaxis | Etiquetas `<?php ?>` y `<?= ?>` mezcladas con HTML, con funciones nativas del lenguaje. | Scriptlets `<% %>`, expresiones EL `${}` y etiquetas JSTL como `<c:forEach>` y `<c:out>`, que separan mejor la vista de la lógica. |
| Seguridad básica | `htmlspecialchars` para escapar salida, `filter_input` y `filter_var` para validar entrada. | `<c:out>` escapa por defecto, y la validación se hace con expresiones regulares y comprobaciones en Java. Ambos requieren validar siempre en el servidor. |
| Madurez del ecosistema | Lenguaje de 1995 con una comunidad web muy grande. Usa Composer y Packagist, con frameworks como Laravel y Symfony y plataformas como WordPress. | Tecnología de 1999 integrada en Jakarta EE. Usa Maven y Gradle, con frameworks como Spring. Es habitual en sistemas empresariales y heredados, y hoy suele convivir con otras capas de vista. |

### Aplicado en este proyecto

| Elemento | php-app | jsp-app |
|---|---|---|
| Archivos | `index.html`, `procesar.php`, `error.php` | `index.jsp`, `procesar.jsp`, `error.jsp`, `WEB-INF/web.xml` |
| URL local | `http://localhost/php-app/` | `http://localhost:8080/jsp-app/` |
| Validación del método | `$_SERVER['REQUEST_METHOD']` con respuesta 405 y cabecera `Allow: POST` | `request.getMethod()` con `sendError(405)` y cabecera `Allow: POST` |
| Lectura de datos | `filter_input(INPUT_POST, ...)` | `request.getParameter(...)` |
| Validación | Longitud, expresión regular `\p{L}` y `FILTER_VALIDATE_EMAIL` | Longitud, expresión regular `\p{L}` y expresión regular de correo |
| Prevención de XSS | `htmlspecialchars` mediante la función `e()` | `<c:out>` |
| Sesión | `$_SESSION['registros']` con cookie `HttpOnly` y `SameSite=Lax` | `session.getAttribute("registros")` con cookie `JSESSIONID` `HttpOnly` |
| Iteración de la tabla | `foreach` | `<c:forEach>` con `varStatus` |
| Errores 4xx y 5xx | Función `fallar()` que carga `error.php` | `sendError` y `<error-page>` en `web.xml` que apuntan a `error.jsp` |