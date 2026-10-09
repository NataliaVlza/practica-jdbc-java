<div align="center">
  <img width=100% src="https://capsule-render.vercel.app/api?type=waving&height=100&color=FFF5BA&reversal=true" />
</div>

<h1 align="center">
  <a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.herokuapp.com?font=Righteous&pause=500&color=D4AC0D&size=35&center=true&vCenter=true&random=false&width=600&lines=Consulta+de+Kardex+JDBC" alt="Consulta de Kardex JDBC" /></a>
</h1>
<p align="center"><b>Conectividad Java y PostgreSQL para UniversidadDB | Universidad de Sonora</b></p>

<br>

<p><b>Creador y Modalidad</b></p>

* **Estudiante:** Natalia Valenzuela ([@NataliaVlza](https://github.com/NataliaVlza))
* **Institución:** Universidad de Sonora (UNISON) - Facultad Interdisciplinaria de Ingenierías
* **Modalidad:** Proyecto guiado y desarrollado en sesiones prácticas de laboratorio.
* **Contacto:** natalia.sanchezvlza@gmail.com
* **Ubicación:** Hermosillo, Sonora, México

<br>

<p><b><font size="4">Descripción del Proyecto</font></b></p>

<p>Aplicación de consola en Java que se conecta a una base de datos relacional <b>PostgreSQL</b> (<code>universitydb</code>) a través del controlador <b>JDBC</b>. El programa permite consultar en tiempo real el historial académico (kardex) de cualquier estudiante ingresando su apellido o nombre desde la terminal.</p>

<p><b>Funcionalidades y Requisitos Implementados:</b></p>

* **Conexión JDBC:** Establecimiento y gestión segura de conexiones cliente-servidor con PostgreSQL.
* **Consultas SQL Dinámicas:** Recuperación de datos cruzados entre tablas de estudiantes, departamentos, asignaturas y calificaciones mediante sentencias `SELECT` e `JOIN`.
* **Formato de Salida en Consola:** Despliegue estructurado y tabulado del historial académico, mostrando ID de estudiante, departamento, asignaturas cursadas, período lectivo y calificación final.

<br>

<p><b><font size="4">Imágenes del Proyecto</font></b></p>

<p><b>1. Ejecución de la Consulta e Historial Académico</b><br>
Muestra la interacción en consola solicitando el nombre del alumno, la confirmación de la conexión exitosa con PostgreSQL y el kardex formateado en pantalla.</p>

![Ejecución Kardex JDBC](screenshots/terminal.png)

<br>

<p><b>2. Esquema de la Base de Datos en PostgreSQL</b><br>
Estructura de las 11 tablas relacionales de la base de datos <code>universitydb</code> (incluyendo <code>student</code>, <code>course</code> y <code>takes</code>) consultadas mediante JDBC.</p>

![Tablas PostgreSQL](screenshots/tablas.png)

<br>

<p align="center"><sub>Créditos de componentes visuales: <a href="https://github.com/kyechan99/capsule-render/blob/main/docs/README_es.md">capsule-render</a> por @kyechan99 y <a href="https://github.com/denvercoder1">readme-typing-svg</a> por @DenverCoder1</sub></p>

<div align="center">
  <img width=100% src="https://capsule-render.vercel.app/api?type=waving&height=100&color=FFF5BA&section=footer" />
</div>
