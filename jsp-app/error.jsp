<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
  Integer codigo = (Integer) request.getAttribute("codigo");
  if (codigo == null) {
    codigo = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
  }
  if (codigo == null) {
    codigo = 404;
  }

  String titulo = (String) request.getAttribute("titulo");
  String detalle = (String) request.getAttribute("detalle");
  if (titulo == null || detalle == null) {
    if (codigo == 405) {
      titulo = "Método no permitido";
      detalle = "Esta página solo recibe datos enviados desde el formulario de registro.";
    } else if (codigo == 422) {
      titulo = "Datos inválidos";
      detalle = "El nombre o el correo electrónico no tienen un formato válido.";
    } else if (codigo >= 500) {
      titulo = "Error del servidor";
      detalle = "Ocurrió un problema al procesar la solicitud. Inténtalo nuevamente en unos minutos.";
    } else {
      titulo = "Página no encontrada";
      detalle = "La página que buscas no existe o fue movida.";
    }
  }

  response.setStatus(codigo);
  request.setAttribute("codigo", codigo);
  request.setAttribute("titulo", titulo);
  request.setAttribute("detalle", detalle);
  request.setAttribute("icono", codigo >= 500 ? "octagon-alert" : "triangle-alert");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Error ${codigo} | Hospital Nacional Ramiro Prialé Prialé</title>
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
    <section class="contenedor">
      <div class="estado">
        <span class="insignia"><i data-lucide="${icono}" class="icono icono--pequeno"></i>Error ${codigo}</span>
        <h1 class="titulo-lg"><c:out value="${titulo}"/></h1>
        <p><c:out value="${detalle}"/></p>
        <a class="boton boton--negro" href="index.jsp#registro"><i data-lucide="arrow-left" class="icono"></i>Volver al formulario</a>
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
