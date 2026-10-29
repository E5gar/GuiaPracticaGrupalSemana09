<?php
date_default_timezone_set('America/Lima');

function e(string $texto): string
{
    return htmlspecialchars($texto, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function fallar(int $codigo, string $titulo, string $detalle): never
{
    require __DIR__ . '/error.php';
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Allow: POST');
    fallar(405, 'Método no permitido', 'Esta página solo recibe datos enviados desde el formulario de registro.');
}

if (!session_start(['cookie_httponly' => true, 'cookie_samesite' => 'Lax'])) {
    fallar(500, 'Error del servidor', 'No se pudo iniciar la sesión. Inténtalo nuevamente en unos minutos.');
}

$nombre = trim((string) filter_input(INPUT_POST, 'nombre', FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW));
$nombre = preg_replace('/\s+/u', ' ', $nombre) ?? '';
$correo = trim((string) filter_input(INPUT_POST, 'correo', FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW));

$errores = [];

$largo = mb_strlen($nombre, 'UTF-8');
if ($largo < 2 || $largo > 60 || !preg_match('/^[\p{L}][\p{L}\s.\'-]*$/u', $nombre)) {
    $errores[] = 'El nombre debe tener entre 2 y 60 caracteres y contener solo letras, espacios, puntos, apóstrofes o guiones.';
}

if (strlen($correo) > 120 || filter_var($correo, FILTER_VALIDATE_EMAIL) === false) {
    $errores[] = 'El correo electrónico no tiene un formato válido.';
}

if ($errores) {
    fallar(422, 'Datos inválidos', implode(' ', $errores));
}

if (!isset($_SESSION['registros']) || !is_array($_SESSION['registros'])) {
    $_SESSION['registros'] = [];
}

$_SESSION['registros'][] = [
    'nombre' => $nombre,
    'correo' => $correo,
    'fecha' => date('d/m/Y H:i'),
];

$registros = $_SESSION['registros'];
?>
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
      <a class="logo" href="index.html">
        <span class="logo__nombre">Ramiro Prialé Prialé</span>
        <span class="logo__sub">Hospital Nacional</span>
      </a>
      <input class="menu-check" type="checkbox" id="menu">
      <label class="menu-boton" for="menu">
        <i data-lucide="menu" class="icono"></i>
        <span class="oculto-visual">Abrir menú</span>
      </label>
      <nav class="nav" aria-label="Principal">
        <a class="nav-enlace enlace-roll" href="index.html"><span class="enlace-roll__texto">Inicio</span><span class="enlace-roll__texto" aria-hidden="true">Inicio</span></a>
        <a class="nav-enlace enlace-roll" href="index.html#como-funciona"><span class="enlace-roll__texto">Cómo funciona</span><span class="enlace-roll__texto" aria-hidden="true">Cómo funciona</span></a>
        <a class="nav-enlace enlace-roll" href="index.html#ubicacion"><span class="enlace-roll__texto">Ubicación</span><span class="enlace-roll__texto" aria-hidden="true">Ubicación</span></a>
        <a class="boton" href="index.html#registro">Registrar contacto</a>
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
            <span>El registro de <strong><?= e($nombre) ?></strong> se guardó correctamente en tu sesión.</span>
          </div>
        </div>

        <div class="apilar">
          <span class="insignia"><i data-lucide="users" class="icono icono--pequeno"></i>Total: <?= count($registros) ?></span>
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
                <?php foreach ($registros as $indice => $registro): ?>
                <tr>
                  <td><?= $indice + 1 ?></td>
                  <td><?= e($registro['nombre']) ?></td>
                  <td><?= e($registro['correo']) ?></td>
                  <td><?= e($registro['fecha']) ?></td>
                </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
          </div>
        </div>

        <div class="fila">
          <a class="boton boton--negro" href="index.html#registro"><i data-lucide="user-plus" class="icono"></i>Registrar otro contacto</a>
          <a class="boton boton--borde" href="index.html"><i data-lucide="arrow-left" class="icono"></i>Volver al inicio</a>
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
            <li><a href="index.html">Inicio</a></li>
            <li><a href="index.html#registro">Registro</a></li>
            <li><a href="index.html#ubicacion">Ubicación</a></li>
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