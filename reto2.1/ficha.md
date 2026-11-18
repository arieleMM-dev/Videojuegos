# Ficha del dispositivo: teclado

- **Tecnologia de captura:** en un teclado convencional, un controlador recorre una matriz de filas y columnas para detectar que contactos se cierran al presionar una tecla. El sistema recibe codigos de las teclas y eventos de pulsacion y liberacion.
- **Tipo de senal:** digital. En esta actividad una tecla esta pulsada o no lo esta; no se mide la fuerza con la que la presiono. Por eso `get_action_strength("move_right")` da 1.00 con D y 0.00 al soltarla.
- **Ventaja:** permite asignar distintas acciones a muchas teclas y repetirlas con precision.
- **Limitacion:** este teclado no permite graduar la direccion como un stick analogico. Con A o D, la accion esta desactivada o activada.
- **Juego de ejemplo:** Minecraft en computadora, que usa teclas de movimiento y la barra espaciadora para saltar.
- **Coincidencia con el Hud:** al pulsar A, D o Space, el panel identifica Teclado y senal Digital. Si se mueve el raton, el ultimo evento cambia de dispositivo; eso no modifica la clasificacion del teclado.

## Fuentes

- QMK Firmware: [How a Keyboard Matrix Works](https://docs.qmk.fm/how_a_matrix_works). Matriz y deteccion de contactos.
- Microsoft Learn: [Keyboard Input Overview](https://learn.microsoft.com/en-us/windows/win32/inputdev/about-keyboard-input). Codigos de tecla, pulsaciones y liberaciones.
- Minecraft: [Minecraft Controls](https://www.minecraft.net/en-us/article/minecraft-controls). Ejemplo de uso del teclado en un videojuego.

Nota: se describe un teclado convencional usado como entrada digital, no un teclado especial con sensores analogicos de recorrido.
