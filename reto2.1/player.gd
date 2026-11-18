extends CharacterBody2D

@export var velocidad = 200.0
@export var fuerza_salto = 400.0
var gravedad = 1000.0
var suelo = 0.0
func _ready():
	suelo = position.y
func _physics_process(delta):
	velocity.x = Input.get_axis("move_left", "move_right") * velocidad
	if Input.is_action_just_pressed("jump") and position.y >= suelo:
		velocity.y = -fuerza_salto
	velocity.y = velocity.y + gravedad * delta
	move_and_slide()
	if position.y > suelo:
		position.y = suelo
		velocity.y = 0
	position.x = clampf(position.x, 20, get_viewport_rect().size.x - 20)
