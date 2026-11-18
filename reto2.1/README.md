# Reto 2.1: panel de entradas

Proyecto minimo para **Godot 4.7.2**. Utiliza un solo Label y un personaje cuadrado. Se basa en el codigo de sondeo y eventos trabajado en clase.

## Archivos

- `Main.tscn`: escena principal.
- `main.gd`: lee las entradas y actualiza el unico Hud.
- `player_base.tscn`: escena reutilizable del personaje.
- `player.gd`: movimiento horizontal.
- `ficha.md`: ficha del teclado, con fuentes.
- `respuestas.md`: respuestas a las tres preguntas.
- `.gitignore`: excluye la carpeta generada `.godot`.

La carpeta local se llama **reto2.1**, como solicito el estudiante. La consigna escribe **reto-2.1**; antes de la entrega definitiva se debe respetar el nombre literal que exija el docente.

## 1. Abrir el proyecto que ya esta preparado

1. Abre Godot 4.7.2.
2. En el administrador de proyectos, pulsa **Importar**.
3. Selecciona el archivo `project.godot` de esta carpeta.
4. Abre `Main.tscn`.
5. Pulsa **F6** y haz clic en la ventana del juego para darle el foco.

Para construirlo manualmente desde cero, sigue los pasos siguientes.

## 2. Crear el proyecto desde cero

1. En Godot pulsa **Nuevo proyecto**.
2. Usa una carpeta vacia llamada `reto2.1`.
3. Elige el renderizador **Compatibilidad**.
4. En **Proyecto > Ajustes del proyecto > Pantalla > Ventana**, establece:
   - Viewport Width: **1152**.
   - Viewport Height: **648**.

Esto permite colocar al personaje en (576, 500), como indica el PDF.

## 3. Crear las acciones del Input Map

En **Proyecto > Ajustes del proyecto > Mapa de entradas**, crea exactamente:

| Accion | Tecla |
| --- | --- |
| `jump` | Space |
| `move_left` | A |
| `move_right` | D |

Para cada accion, pulsa el boton de agregar evento, presiona la tecla correspondiente y acepta. No uses `space` como nombre de accion: el nombre que exige la consigna es `jump`.

No hacen falta `move_up` ni `move_down`: el reto pide movimiento horizontal y mostrar la accion de salto.

## 4. Crear player_base.tscn

1. Crea una escena nueva con raiz **CharacterBody2D**.
2. Renombra la raiz **Player**.
3. Agrega un hijo **ColorRect**, con nombre **Imagen**.
4. En el Inspector del ColorRect, abre su transformacion y establece:
   - Position X: **-20**.
   - Position Y: **-20**.
   - Size X: **40**.
   - Size Y: **40**.
   - Color: celeste o cualquier color visible.
   - Mouse > Filter: **Ignore**.
5. Agrega otro hijo **CollisionShape2D**.
6. En Shape, crea un **RectangleShape2D** con Size **(40, 40)**.
7. Guarda la escena como **player_base.tscn**.
8. Adjunta a Player el archivo **player.gd** y pega el script de movimiento que aparece al final de esta guia.

El cuadrado permite ver al personaje sin descargar imagenes ni crear mas etiquetas.

## 5. Crear Main.tscn

1. Crea otra escena con raiz **Node2D**.
2. Llama a la raiz **Main**.
3. Agrega un unico **Label** hijo llamado **Hud**, respetando la mayuscula.
4. En el Inspector de Hud configura Position **(40, 40)**. Puedes usar Size **(810, 290)** y fuente de **24**.
5. Arrastra `player_base.tscn` desde el panel de archivos hasta Main para crear una instancia.
6. Selecciona esa instancia Player y establece Position **(576, 500)**.
7. Guarda la escena como **Main.tscn**.
8. Adjunta a Main el archivo **main.gd** y pega el script del panel que aparece al final.

Arbol solicitado:

```text
Main (Node2D)             main.gd
├── Hud (Label)           posicion (40, 40)
└── Player                instancia de player_base.tscn
                          posicion (576, 500)
```

Dentro de la escena del personaje:

```text
Player (CharacterBody2D)  player.gd
├── Imagen (ColorRect)
└── CollisionShape2D
```

Si aprovechas tu escena anterior, renombra `Label` a `Hud`; por eso el codigo utiliza `$Hud`.

## 6. Preparar los dos Markdown

En la misma carpeta del proyecto crea:

- `ficha.md`: tecnologia de captura, tipo de senal con justificacion, ventaja, limitacion, juego y fuente.
- `respuestas.md`: las tres respuestas del PDF.

Ambos archivos ya estan escritos en este proyecto. Leelos y asegurate de poder explicar sus respuestas.

## 7. Ejecutar y comprobar

1. Guarda todos los archivos.
2. Abre la pestana **Main.tscn**, no la del personaje.
3. Pulsa **F6**.
4. Haz clic dentro de la ventana del juego.
5. Prueba las acciones de la tabla:

| Prueba | Resultado esperado |
| --- | --- |
| Mantener D | El personaje va a la derecha. Eje 1.00, fuerza derecha 1.00. |
| Soltar D | El movimiento se detiene. Aumenta el contador del evento de liberacion. |
| Mantener A | El personaje va a la izquierda. Eje -1.00, fuerza derecha 0.00. |
| Mantener Space | `jump: true`. Al soltar: `false`. |
| Mantener D aproximadamente 2 s | Muchos cuadros pulsados y solo dos eventos desde cero: pulsar y soltar. |
| Girar la rueda | Clase `InputEventMouseButton`, senal `Digital (paso de rueda)`. |
| Hacer clic | Clase `InputEventMouseButton`, senal `Digital (clic)`. |
| Mover el raton | Clase `InputEventMouseMotion`, senal `Posicion`. |
| Pulsar teclas repetidamente por mantener D | El eco no aumenta el contador de eventos. |

**El PDF exige mostrar el estado de jump, no implementar un salto fisico.** Por eso Space cambia el booleano del Hud y el personaje solo se desplaza horizontalmente.

Para probar la velocidad del Inspector: termina con F8, selecciona Player en Main, cambia **Velocidad**, y ejecuta Main otra vez con F6.

El panel conserva el ultimo evento de teclado o raton. Un movimiento del raton posterior a un clic o un paso de rueda reemplazara el evento mostrado. Para observar la rueda, no muevas el raton inmediatamente despues.

Los cuadros se cuentan dentro de `_physics_process`, siguiendo tu codigo base. Son actualizaciones de fisica, normalmente 60 por segundo, no una medicion de los FPS graficos.

## 8. Cobertura de la consigna

| Requisito | Implementacion |
| --- | --- |
| R1 | Input Map: jump/Space, move_left/A y move_right/D. |
| R2 | Booleano jump y valores de eje/fuerza con `%.2f`. |
| R3 | Clase con `get_class()`, nombre e ID del dispositivo, tipo de senal, rueda diferenciada del clic y eco ignorado. |
| R4 | Dos contadores exclusivos de move_right: sondeo y eventos. |
| R5 | Player instanciado, movimiento A/D y velocidad con `@export`. |
| R6 | La ficha dice teclado digital y el Hud muestra Digital para los eventos del teclado. |
| Documentacion | Ficha del dispositivo y respuestas a las tres preguntas. |
| GitHub | Repositorio Videojuegos y commit descriptivo preparados. La publicacion de archivos queda pendiente por indicacion del usuario. |

El ID de un evento de teclado o raton no debe interpretarse como el numero de serie del aparato.

## 9. Organizacion para Git

La carpeta `reto2.1` contiene la actividad dentro del repositorio local `Videojuegos`.

Mensaje sencillo del commit:

```text
Completa reto de entradas con HUD, personaje y documentacion
```

No se incluyen carpetas `.godot` ni archivos temporales de comprobacion en la entrega. Los archivos se mantienen locales hasta autorizar su publicacion.

## 10. Script main.gd

```gdscript
extends Node2D

@onready var label: Label = $Hud

var cuadro_pulsado = 0
var eventos_recibidos = 0
var ultimo_evento = "Ninguno"
var dispositivo = "Teclado"
var tipo_senal = "Digital"

func _physics_process(_delta):
	# Sondeo: contamos solo move_right, como pide el reto.
	if Input.is_action_pressed("move_right"):
		cuadro_pulsado = cuadro_pulsado + 1

	var salto = Input.is_action_pressed("jump")
	var eje = Input.get_axis("move_left", "move_right")
	var fuerza = Input.get_action_strength("move_right")

	label.text = "jump: %s\nget_axis: %.2f\nFuerza derecha: %.2f" % [salto, eje, fuerza]
	label.text += "\nUltimo evento: %s\nDispositivo: %s\nSenal: %s" % [ultimo_evento, dispositivo, tipo_senal]
	label.text += "\nCuadros con D: %d\nEventos de D: %d" % [cuadro_pulsado, eventos_recibidos]

func _input(event: InputEvent):
	# Ignora la repeticion automatica del teclado.
	if event.is_echo():
		return

	if event.is_action("move_right"):
		eventos_recibidos = eventos_recibidos + 1

	if event is InputEventKey:
		dispositivo = "Teclado (ID %d)" % event.device
		tipo_senal = "Digital"
	elif event is InputEventMouseButton:
		dispositivo = "Raton (ID %d)" % event.device
		# La rueda tambien es InputEventMouseButton: se revisa primero.
		if event.button_index in [MOUSE_BUTTON_WHEEL_UP, MOUSE_BUTTON_WHEEL_DOWN, MOUSE_BUTTON_WHEEL_LEFT, MOUSE_BUTTON_WHEEL_RIGHT]:
			tipo_senal = "Digital (paso de rueda)"
		else:
			tipo_senal = "Digital (clic)"
	elif event is InputEventMouseMotion:
		dispositivo = "Raton (ID %d)" % event.device
		tipo_senal = "Posicion"
	else:
		return

	ultimo_evento = event.get_class()
```

## 11. Script player.gd

```gdscript
extends CharacterBody2D

@export var velocidad = 200.0

func _physics_process(_delta):
	velocity.x = Input.get_axis("move_left", "move_right") * velocidad
	velocity.y = 0
	move_and_slide()
	position.x = clampf(position.x, 20, get_viewport_rect().size.x - 20)
```
