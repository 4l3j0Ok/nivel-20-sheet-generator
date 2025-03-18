## FAQ

### ¿Para que sirve esta herramienta?

Alejoide's Nivel 20 Sheet Generator es un proyecto que permite generar la hoja de tu personaje de  Dungeons And Dragons 5ta Edición creado en [Nivel20](https://nivel20.com).

### ¿Cómo se usa?

1. Ingresa a la página de [Nivel20](https://nivel20.com).
2. Crea tu personaje del juego de rol Dungeons And Dragons 5ta Edición.
3. Copia el link de tu personaje.
4. Ingresa a la página de [Alejoide's Nivel 20 Sheet Generator](https://sheet-generator.alejoide.com/).
5. Pega el link de tu personaje en el campo de texto y presiona el botón "Generar". En ese momento comenzará a generarse tu hoja de personaje.

### ¿Cuál es el template de la hoja de personaje?

El template de la hoja de personaje es el utilizado actualmente por [Nivel20](https://nivel20.com) pero con algunas modificaciones:

- Se cambió la fuente por [Montserrat](https://fonts.google.com/specimen/Montserrat).
- Se cambió el color de la fuente por un gris, reemplazando el azul original.
- Se modificó el tamaño de las secciones "Historia del personaje", "Rasgos" y "Conjuros".
- Se cambiaron las `X` que indicaban proficiencia en habilidades y tiradas de salvación por un circulo relleno en su lugar.
- Se agregó soporte de Markdown para que los apartados que lo disponen sean renderizados correctamente.

### ¿Por qué se creó esta herramienta?

Actualmente Nivel20 permite exportar la hoja de tu personaje en formato PDF, pero apartados los conjuros o los rasgos no se muestran al completo. Apartados como "Historia del personaje", "Rasgos" y "Conjuros" no son renderizados correctamente si se utiliza Markdown.
Por estas razones, se creó esta herramienta para que puedas tener una versión digital de tu hoja de personaje con un mejor formato.

### ¿Es confiable esta herramienta?

Sí, esta es una herramienta de código abierto y no tiene otro propósito que el de generar la hoja de tu personaje de Dungeons And Dragons 5ta Edición creado en [Nivel20](https://nivel20.com). Puedes revisar el código fuente en el [repositorio de GitHub](https://github.com/4l3j0Ok/nivel-20-sheet-generator).

### ¿Cómo puedo colaborar?

Si quieres colaborar con el proyecto, puedes hacerlo de las siguientes maneras:
- Reportando errores o bugs en la [sección de issues](https://github.com/4l3j0Ok/nivel-20-sheet-generator/issues).
- Realizando un pull request con mejoras o nuevas funcionalidades.
- Compartiendo la herramienta con tus amigos y en tus redes sociales.

### ¿Qué tecnologías se utilizaron para crear esta herramienta?

- FastAPI (API)
- Jinja2 (API)
- Astro (Frontend)