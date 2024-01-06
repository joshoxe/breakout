extends CharacterBody2D


var SPEED = (Player.score + 1 * 2) * 400.0

func _physics_process(delta):
	if Player.game_started == false:
			velocity = Vector2.ZERO
			position.x = get_viewport().get_mouse_position().x
			
			position.x = clamp(position.x, 0, 1920)

			move_and_slide()
	else:
		if velocity.length() > 0:
			var collision = move_and_collide(velocity * delta)
			
			if collision:
				var collider = collision.get_collider()
				bounce(collider, collision.get_normal())
				if collider.has_method("destroy"):
					collider.destroy()
		
func start_ball():
	velocity = Vector2(randi_range(-200, 200), (SPEED * -1.0))

func bounce(collider, normal):
	if collider.name.begins_with("Wall") or collider.name.begins_with("Ceiling"):
		var bounce_angle = velocity.angle_to(normal)
		var min_bounce_angle = PI / 4  # Set to desired minimum angle
		if abs(bounce_angle) < min_bounce_angle:
			bounce_angle = min_bounce_angle * sign(bounce_angle)
			normal = Vector2(cos(bounce_angle), sin(bounce_angle))
		velocity = velocity.bounce(normal)
	else:
		velocity = global_position - collider.global_position
		velocity = velocity.normalized() * SPEED
		
func reset():
	position = Vector2(879, 952)
