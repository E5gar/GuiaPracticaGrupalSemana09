<%-- Parte Steven --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
  Integer codigo = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
  String mensaje;
  if (codigo != null && codigo == 405) {
    mensaje = "Acceso no permitido. Use el formulario para enviar sus datos.";
  } else if (codigo != null && codigo == 400) {
    mensaje = "Los datos enviados no son válidos. Revise el nombre y el correo.";
  } else if (codigo != null && codigo == 404) {
    mensaje = "La página solicitada no existe.";
  } else {
    mensaje = "Ocurrió un error al procesar la solicitud.";
  }
  request.setAttribute("mensaje", mensaje);
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Consultas Médicas HNRPP | Error</title>
  <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
  <main>
    <section class="seccion">
      <div class="contenedor contenedor--lectura estado">
        <h1>No se pudo completar la solicitud</h1>
        <div class="alerta alerta--error"><c:out value="${mensaje}"/></div>
        <a href="index.jsp" class="boton boton--negro">Volver al formulario</a>
      </div>
    </section>
  </main>
</body>
</html>