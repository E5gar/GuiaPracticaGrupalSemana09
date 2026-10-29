<?php
$codigo = $codigo ?? 404;
$titulo = $titulo ?? 'Página no encontrada';
$detalle = $detalle ?? 'La página que buscas no existe o fue movida.';
$icono = $codigo >= 500 ? 'octagon-alert' : 'triangle-alert';
http_response_code($codigo);
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Error <?= (int) $codigo ?> | Hospital Nacional Ramiro Prialé Prialé</title>
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
    <section class="contenedor">
      <div class="estado">
        <span class="insignia"><i data-lucide="<?= $icono ?>" class="icono icono--pequeno"></i>Error <?= (int) $codigo ?></span>
        <h1 class="titulo-lg"><?= htmlspecialchars($titulo, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?></h1>
        <p><?= htmlspecialchars($detalle, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?></p>
        <a class="boton boton--negro" href="index.html#registro"><i data-lucide="arrow-left" class="icono"></i>Volver al formulario</a>
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