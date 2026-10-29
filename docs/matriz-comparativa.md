# Matriz comparativa PHP y JSP
Comparación de las dos implementaciones del Sistema de Registro de Contacto del Hospital Nacional Ramiro Prialé Prialé.

## Tecnología y entorno
| Aspecto | PHP | JSP |
|---|---|---|
| Lenguaje | PHP 8.2 | Java 17 con JSP 3.1 y EL 5.0 |
| Servidor | Apache 2.4 de XAMPP con el módulo de PHP | Apache Tomcat 10.1 con el motor Jasper |
| Puerto por defecto | 80 | 8080 |
| Modelo de ejecución | El script se interpreta en cada petición | La página se traduce a un servlet, se compila una vez y se reutiliza |
| Configuración de la app | No necesita archivo propio | `WEB-INF/web.xml` con página de inicio, cookie de sesión y páginas de error |
| Librerías externas | Ninguna, usa extensiones nativas | JSTL de Jakarta en `WEB-INF/lib` |
| Despliegue | Carpeta en `htdocs` | Carpeta en `webapps` |

## Archivos equivalentes
| Función | PHP | JSP |
|---|---|---|
| Formulario | `index.html` | `index.jsp` |
| Procesamiento y respuesta | `procesar.php` | `procesar.jsp` |
| Página de error | `error.php` | `error.jsp` |
| Estilos | `css/estilos.css` | `css/estilos.css`, mismo archivo |

## Manejo de la petición
| Aspecto | PHP | JSP |
|---|---|---|
| Verificar el método POST | `$_SERVER['REQUEST_METHOD']` | `request.getMethod()` |
| Leer los campos | `filter_input(INPUT_POST, 'nombre', ...)` | `request.getParameter("nombre")` |
| Codificación de entrada | UTF-8 por defecto en PHP 8 | `request.setCharacterEncoding("UTF-8")` antes de leer |
| Validar el nombre | `preg_match` con `\p{L}` y `mb_strlen` | `String.matches` con `\p{L}` y `codePointCount` |
| Validar el correo | `filter_var` con `FILTER_VALIDATE_EMAIL` | Expresión regular con `String.matches` |
| Fecha del registro | `date()` con zona `America/Lima` | `ZonedDateTime` con zona `America/Lima` |

## Sesión y seguridad
| Aspecto | PHP | JSP |
|---|---|---|
| Iniciar la sesión | `session_start()` explícito | Implícita, el objeto `session` ya existe |
| Cookie de sesión | `PHPSESSID` | `JSESSIONID` |
| Cookie HttpOnly | Opción `cookie_httponly` en `session_start` | `<http-only>` en `web.xml` |
| Guardar registros | Arreglo en `$_SESSION['registros']` | `List<Map<String, String>>` en el atributo `registros` |
| Protección XSS | `htmlspecialchars` con `ENT_QUOTES` | `<c:out>` de JSTL, que escapa por defecto |
| Recorrer la tabla | `foreach` | `<c:forEach>` |

## Manejo de errores
| Código | PHP | JSP |
|---|---|---|
| 405 | `procesar.php` incluye `error.php` y envía `Allow: POST` | `procesar.jsp` reenvía a `error.jsp` y envía `Allow: POST` |
| 422 | `procesar.php` incluye `error.php` con el detalle | `procesar.jsp` reenvía a `error.jsp` con el detalle |
| 404 y 500 | Lo resuelve Apache | `error-page` en `web.xml` dirige a `error.jsp` |
| Fijar el código | `http_response_code()` | `response.setStatus()` |

## Ventajas y desventajas
| Criterio | PHP | JSP |
|---|---|---|
| Curva de aprendizaje | Baja, sintaxis directa | Media, requiere Java, EL y JSTL |
| Puesta en marcha | Inmediata con XAMPP | Requiere JDK, Tomcat y librerías JSTL |
| Rendimiento | Bueno, depende de OPcache | Alto tras la primera compilación |
| Tipado | Dinámico | Estático, los errores se detectan al compilar |
| Escalabilidad | Adecuada para proyectos pequeños y medianos | Adecuada para aplicaciones empresariales |
| Hosting | Muy disponible y económico | Menos común, requiere contenedor de servlets |

## Conclusión
Ambas aplicaciones cumplen el mismo ciclo HTTP: reciben un POST, validan los datos, los guardan en la sesión y responden con una tabla escapada contra XSS o con una página de error. PHP resuelve el caso con menos configuración y menos pasos de despliegue. JSP exige más infraestructura, pero ofrece tipado estático, separación entre lógica y vista mediante EL y JSTL, y la configuración declarativa de `web.xml`.
