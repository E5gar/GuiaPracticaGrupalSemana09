<%-- Parte Steven --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
  request.setCharacterEncoding("UTF-8");
  if (!"POST".equals(request.getMethod())) {
    response.sendError(405);
    return;
  }
  String nombre = request.getParameter("nombre");
  String correo = request.getParameter("correo");
  if (nombre == null || nombre.trim().isEmpty() || correo == null || !correo.trim().matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
    response.sendError(400);
    return;
  }
  List<Map<String, String>> registros = (List<Map<String, String>>) session.getAttribute("registros");
  if (registros == null) registros = new ArrayList<>();
  registros.add(Map.of("nombre", nombre.trim(), "correo", correo.trim()));
  session.setAttribute("registros", registros);
  request.setAttribute("registros", registros);
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Consultas Médicas HNRPP | Resultado</title>
  <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
  <main>
    <section class="seccion">
      <div class="contenedor contenedor--lectura">
        <h1 class="mb-6">Registros almacenados</h1>
        <div class="tabla-contenedor">
          <table class="tabla">
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Correo</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${registros}" var="r">
                <tr>
                  <td><c:out value="${r.nombre}"/></td>
                  <td><c:out value="${r.correo}"/></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <a href="index.jsp" class="boton boton--borde mt-5">Volver al formulario</a>
      </div>
    </section>
  </main>
</body>
</html>