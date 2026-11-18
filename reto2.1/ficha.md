# Ficha del dispositivo: teclado de mi laptop

- **Tecnologia de captura:** en un teclado convencional, un controlador recorre la matriz de filas y columnas para detectar que contactos de este se cierran al presionar una tecla. El sistema recibe los codigos de las teclas y eventos de pulsacion y liberacion.
- **Tipo de senal:** digital. En esta actividad una tecla esta pulsada o no lo esta. Por eso `get_action_strength("move_right")` da 1.00 con D y 0.00 al soltarla. Esta normalizado de 0 a 1 solo para mostrar que se presiona
- **Ventaja:** permite asignar distintas acciones a muchas teclas y repetirlas lo que y quiera.
- **Limitacion:** este teclado no permite graduar la direccion como un stick analogico. Con A o D, la accion esta desactivada o activada ya que funciona con el presionado del botón.
- **Juego de ejemplo:** Minecraft en computadora que lo tengo en mi pc que usa teclas de movimiento  simples y la barra espaciadora para saltar.

## Fuentes

- QMK Firmware: [How a Keyboard Matrix Works](https://docs.qmk.fm/how_a_matrix_works). Matriz y deteccion de contactos.
- Microsoft Learn: [Keyboard Input Overview](https://learn.microsoft.com/en-us/windows/win32/inputdev/about-keyboard-input). Codigos de tecla, pulsaciones y liberaciones.
- Minecraft: [Minecraft Controls](https://www.minecraft.net/en-us/article/minecraft-controls). Ejemplo de uso del teclado en un videojuego.

