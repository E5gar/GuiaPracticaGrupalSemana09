<?php
// TODO: Iniciar sesión, validar método POST, sanitizar inputs
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    exit('Método no permitido');
}

$nombre = /* TODO: filter_input + htmlspecialchars */;
$correo = /* TODO: filter_input + FILTER_VALIDATE_EMAIL */;

if (!$nombre || !$correo) {
    exit('Datos inválidos');
}

// TODO: Guardar en sesión o array estático para demo
session_start();
$_SESSION['registros'][] = ['nombre' => $nombre, 'correo' => $correo];

// TODO: Renderizar tabla de registros desde $_SESSION
echo "<h3>Registros almacenados</h3>";
echo "<table border='1'><tr><th>Nombre</th><th>Correo</th></tr>";
// Completar iteración
echo "</table>";
?>