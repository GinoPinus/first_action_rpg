extends CharacterBody2D

const SPEED: float = 100
var direction = 0
var last_direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	#Update direction
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	
	#animations
	if direction.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("side_walk")
		last_direction = direction
	elif direction.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("side_walk")
		last_direction = direction
	elif direction.y > 0:
		$AnimatedSprite2D.play("front_walk")
		last_direction = direction
	elif direction.y < 0:
		$AnimatedSprite2D.play("back_walk")
		last_direction = direction
	
	if direction == Vector2.ZERO:
		if last_direction.x > 0:
			$AnimatedSprite2D.play("side_idle")
		if last_direction.x < 0:
			$AnimatedSprite2D.play("side_idle")
		if last_direction.y > 0:
			$AnimatedSprite2D.play("front_idle")
		if last_direction.y < 0:
			$AnimatedSprite2D.play("back_idle")
			
	move_and_slide()
