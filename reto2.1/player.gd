extends CharacterBody2D

@export var velocidad = 200.0

func _physics_process(_delta):
	velocity.x = Input.get_axis("move_left", "move_right") * velocidad
	velocity.y = 0
	move_and_slide()
	position.x = clampf(position.x, 20, get_viewport_rect().size.x - 20)
