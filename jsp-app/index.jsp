<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Consultas Médicas | Hospital Nacional Ramiro Prialé Prialé</title>
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
    <section class="hero">
      <img class="hero__media" src="https://images.unsplash.com/photo-1538108149393-fbbd81895907?auto=format&fit=crop&w=1600&q=80" alt="Lorem ipsum dolor sit amet">
      <div class="contenedor">
        <div class="hero__contenido animar">
          <h2>HOSPITAL NACIONAL · HUANCAYO</h2>
          <h1>Consultas médicas para el Hospital Nacional Ramiro Prialé Prialé</h1>
          <p>Registra tus datos de contacto y revisa en pantalla la información enviada. Un sistema simple, validado y seguro.</p>
          <div class="hero__acciones">
            <a class="boton boton--blanco boton--grande" href="#registro"><i data-lucide="clipboard-list" class="icono"></i>Registrar contacto</a>
            <a class="boton boton--borde-claro boton--grande" href="#ubicacion"><i data-lucide="map-pin" class="icono"></i>Cómo llegar</a>
          </div>
        </div>
      </div>
    </section>

    <section class="seccion" id="registro">
      <div class="contenedor dividido">
        <div class="apilar">
          <h2>REGISTRO DE CONTACTO</h2>
          <h3 class="titulo-lg">Déjanos tus datos para la consulta médica</h3>
          <p>Completa el formulario con tu nombre y tu correo electrónico. El servidor valida la información, la sanitiza y la guarda en tu sesión.</p>
          <ul class="lista">
            <li class="dato"><i data-lucide="shield-check" class="icono"></i><span>Validación de datos en el servidor</span></li>
            <li class="dato"><i data-lucide="lock" class="icono"></i><span>Protección contra XSS al mostrar la información</span></li>
            <li class="dato"><i data-lucide="table" class="icono"></i><span>Tabla de registros de tu sesión</span></li>
          </ul>
        </div>

        <form class="tarjeta formulario" action="procesar.jsp" method="POST">
          <div class="campo">
            <label for="nombre">Nombre completo</label>
            <input type="text" id="nombre" name="nombre" placeholder="Nombres y apellidos" minlength="2" maxlength="60" autocomplete="name" required>
          </div>
          <div class="campo">
            <label for="correo">Correo electrónico</label>
            <input type="email" id="correo" name="correo" placeholder="correo@ejemplo.com" maxlength="120" autocomplete="email" required>
            <span class="campo__ayuda">Se usa solo para este registro.</span>
          </div>
          <button type="submit" class="boton boton--negro boton--bloque boton--grande"><i data-lucide="send" class="icono"></i>Enviar registro</button>
        </form>
      </div>
    </section>

    <section class="seccion seccion--gris" id="como-funciona">
      <div class="contenedor apilar--amplio">
        <div class="apilar">
          <h2>CÓMO FUNCIONA</h2>
          <h3 class="titulo-lg">Tres pasos, del formulario a la respuesta</h3>
        </div>
        <div class="grilla grilla--3 grilla--amplia">
          <article class="tarjeta">
            <i data-lucide="clipboard-list" class="icono icono--grande"></i>
            <h3 class="titulo-sm">Completa el formulario</h3>
            <p>El navegador envía tu nombre y tu correo mediante una petición HTTP POST.</p>
          </article>
          <article class="tarjeta">
            <i data-lucide="shield-check" class="icono icono--grande"></i>
            <h3 class="titulo-sm">El servidor valida</h3>
            <p>El backend comprueba el método, valida los campos y escapa el contenido antes de mostrarlo.</p>
          </article>
          <article class="tarjeta">
            <i data-lucide="table" class="icono icono--grande"></i>
            <h3 class="titulo-sm">Revisa tus registros</h3>
            <p>La respuesta muestra una tabla con todos los registros guardados en tu sesión.</p>
          </article>
        </div>
      </div>
    </section>

    <section class="seccion" id="ubicacion">
      <div class="contenedor dividido">
        <div class="apilar">
          <h2>UBICACIÓN</h2>
          <h3 class="titulo-lg">Estamos en El Tambo, Huancayo</h3>
          <div class="columna">
            <div class="dato"><i data-lucide="map-pin" class="icono"></i><span>Independencia 266, Huancayo 12006</span></div>
            <div class="dato"><i data-lucide="building-2" class="icono"></i><span>Distrito de El Tambo, Provincia de Huancayo, departamento de Junín, Perú</span></div>
          </div>
        </div>
        <div class="tarjeta tarjeta--sin-relleno">
          <iframe class="imagen imagen--16x9" src="https://www.google.com/maps?q=Independencia+266,+Huancayo,+Junin,+Peru&output=embed" title="Lorem ipsum dolor sit amet" loading="lazy" referrerpolicy="no-referrer-when-downgrade" frameborder="0"></iframe>
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