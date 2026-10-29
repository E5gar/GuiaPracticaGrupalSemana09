<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" import="java.util.*,java.time.*,java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
  request.setCharacterEncoding("UTF-8");

  if (!"POST".equals(request.getMethod())) {
    response.setHeader("Allow", "POST");
    request.setAttribute("codigo", 405);
    request.setAttribute("titulo", "Método no permitido");
    request.setAttribute("detalle", "Esta página solo recibe datos enviados desde el formulario de registro.");
    request.getRequestDispatcher("/error.jsp").forward(request, response);
    return;
  }

  String nombre = request.getParameter("nombre");
  String correo = request.getParameter("correo");
  nombre = nombre == null ? "" : nombre.replaceAll("\\p{Cntrl}", "").trim().replaceAll("\\s+", " ");
  correo = correo == null ? "" : correo.replaceAll("\\p{Cntrl}", "").trim();

  List<String> errores = new ArrayList<>();

  int largo = nombre.codePointCount(0, nombre.length());
  if (largo < 2 || largo > 60 || !nombre.matches("^\\p{L}[\\p{L}\\s.'-]*$")) {
    errores.add("El nombre debe tener entre 2 y 60 caracteres y contener solo letras, espacios, puntos, apóstrofes o guiones.");
  }

  if (correo.length() > 120 || !correo.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*\\.[A-Za-z]{2,}$")) {
    errores.add("El correo electrónico no tiene un formato válido.");
  }

  if (!errores.isEmpty()) {
    request.setAttribute("codigo", 422);
    request.setAttribute("titulo", "Datos inválidos");
    request.setAttribute("detalle", String.join(" ", errores));
    request.getRequestDispatcher("/error.jsp").forward(request, response);
    return;
  }

  List<Map<String, String>> registros = (List<Map<String, String>>) session.getAttribute("registros");
  if (registros == null) {
    registros = new ArrayList<>();
  }

  String fecha = ZonedDateTime.now(ZoneId.of("America/Lima")).format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
  registros.add(Map.of("nombre", nombre, "correo", correo, "fecha", fecha));
  session.setAttribute("registros", registros);

  request.setAttribute("nombre", nombre);
  request.setAttribute("registros", registros);
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Registros | Hospital Nacional Ramiro Prialé Prialé</title>
  <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
  <header class="cabecera">
    <div class="contenedor cabecera__interno">
      <a class="logo" href="index.jsp">
        <span class="logo__nombre">Ramiro Prialé Prialé</span>
        <span class="logo__sub">Hospital Nacional</span>
      </a>
      <input class="menu-check" type="checkbox" id="menu">
      <label class="menu-boton" for="menu">
        <i data-lucide="menu" class="icono"></i>
        <span class="oculto-visual">Abrir menú</span>
      </label>
      <nav class="nav" aria-label="Principal">
        <a class="nav-enlace enlace-roll" href="index.jsp"><span class="enlace-roll__texto">Inicio</span><span class="enlace-roll__texto" aria-hidden="true">Inicio</span></a>
        <a class="nav-enlace enlace-roll" href="index.jsp#como-funciona"><span class="enlace-roll__texto">Cómo funciona</span><span class="enlace-roll__texto" aria-hidden="true">Cómo funciona</span></a>
        <a class="nav-enlace enlace-roll" href="index.jsp#ubicacion"><span class="enlace-roll__texto">Ubicación</span><span class="enlace-roll__texto" aria-hidden="true">Ubicación</span></a>
        <a class="boton" href="index.jsp#registro">Registrar contacto</a>
      </nav>
    </div>
  </header>

  <main>
    <section class="seccion">
      <div class="contenedor apilar--amplio">
        <div class="apilar">
          <h2>REGISTRO DE CONTACTO</h2>
          <h1 class="titulo-lg">Registros almacenados</h1>
          <div class="alerta alerta--exito" role="status">
            <i data-lucide="circle-check" class="icono"></i>
            <span>El registro de <strong><c:out value="${nombre}"/></strong> se guardó correctamente en tu sesión.</span>
          </div>
        </div>

        <div class="apilar">
          <span class="insignia"><i data-lucide="users" class="icono icono--pequeno"></i>Total: ${registros.size()}</span>
          <div class="tabla-contenedor">
            <table class="tabla">
              <thead>
                <tr>
                  <th>N°</th>
                  <th>Nombre</th>
                  <th>Correo</th>
                  <th>Fecha de registro</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${registros}" var="registro" varStatus="estado">
                <tr>
                  <td>${estado.count}</td>
                  <td><c:out value="${registro.nombre}"/></td>
                  <td><c:out value="${registro.correo}"/></td>
                  <td><c:out value="${registro.fecha}"/></td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>

        <div class="fila">
          <a class="boton boton--negro" href="index.jsp#registro"><i data-lucide="user-plus" class="icono"></i>Registrar otro contacto</a>
          <a class="boton boton--borde" href="index.jsp"><i data-lucide="arrow-left" class="icono"></i>Volver al inicio</a>
        </div>
      </div>
    </section>
  </main>

  <footer class="pie seccion--negra">
    <div class="contenedor">
      <div class="pie__grilla">
        <div class="apilar">
          <h3 class="titulo-md">Hospital Nacional Ramiro Prialé Prialé</h3>
          <p>Independencia 266, Huancayo 12006, El Tambo, Huancayo, Junín, Perú.</p>
        </div>
        <div>
          <h4>Navegación</h4>
          <ul class="pie__lista">
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="index.jsp#registro">Registro</a></li>
            <li><a href="index.jsp#ubicacion">Ubicación</a></li>
          </ul>
        </div>
        <div>
          <h4>Proyecto</h4>
          <ul class="pie__lista">
            <li>Laboratorio 09</li>
            <li>Registro de contacto</li>
          </ul>
        </div>
      </div>
      <div class="pie__legal">
        <span>&copy; 2026 Hospital Nacional Ramiro Prialé Prialé</span>
        <span>Universidad Nacional del Centro del Perú - Desarrollo de Aplicaciones Web - Gago Uribe Edgar Robert - Huamanlazo Pariona Steven Luis</span>
      </div>
    </div>
  </footer>

  <script src="https://unpkg.com/lucide@0.468.0/dist/umd/lucide.min.js"></script>
  <script>lucide.createIcons();</script>
</body>
</html>
