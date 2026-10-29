<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Lab 09 | Registro JSP</title>
</head>
<body>
  <h2>Formulario de Contacto (JSP)</h2>
  <!-- TODO: Completar action y campos -->
  <form action="procesar.jsp" method="POST">
    <label>Nombre: <input type="text" name="nombre" required></label><br>
    <label>Correo: <input type="email" name="correo" required></label><br>
    <button type="submit">Enviar</button>
  </form>
</body>
</html>