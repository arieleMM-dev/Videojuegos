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
