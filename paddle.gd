extends CharacterBody2D


func _physics_process(delta):
	velocity = Vector2.ZERO
	position.x = get_viewport().get_mouse_position().x
	
	position.x = clamp(position.x, 0, 1920)

	move_and_slide()
