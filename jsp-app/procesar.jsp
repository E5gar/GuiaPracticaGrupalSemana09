<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
  // TODO: Validar método POST
  if (!"POST".equals(request.getMethod())) {
    response.setStatus(405);
    out.println("Método no permitido");
    return;
  }

  // TODO: Obtener y validar parámetros
  String nombre = request.getParameter("nombre");
  String correo = request.getParameter("correo");

  if (nombre == null || correo == null || correo.isEmpty()) {
    out.println("Datos inválidos");
    return;
  }

  // TODO: Guardar en sesión
  HttpSession session = request.getSession();
  List<Map<String, String>> registros = (List<Map<String, String>>) session.getAttribute("registros");
  if (registros == null) registros = new ArrayList<>();
  registros.add(Map.of("nombre", nombre, "correo", correo));
  session.setAttribute("registros", registros);
%>
<!DOCTYPE html>
<html>
<head><title>Resultado</title></head>
<body>
  <h3>Registros almacenados</h3>
  <table border="1">
    <tr><th>Nombre</th><th>Correo</th></tr>
    <!-- TODO: Iterar con <c:forEach> o scriptlet controlado -->
  </table>
</body>
</html>