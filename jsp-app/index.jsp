<%-- Parte Steven --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Consultas Médicas HNRPP | Formulario</title>
  <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
  <main>
    <section class="seccion">
      <div class="contenedor contenedor--lectura">
        <h1 class="mb-6">Formulario de contacto</h1>
        <form class="formulario" action="procesar.jsp" method="POST">
          <div class="campo">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" required>
          </div>
          <div class="campo">
            <label for="correo">Correo</label>
            <input type="email" id="correo" name="correo" required>
          </div>
          <button type="submit" class="boton boton--negro">Enviar</button>
        </form>
      </div>
    </section>
  </main>
</body>
</html>