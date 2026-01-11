extends CharacterBody2D


const SPEED: float = 20.0
var direction: Vector2 = Vector2.ZERO
var last_direction = direction

var player_in_range: bool = false
var player: Node2D = null


func _physics_process(delta: float) -> void:
	if player_in_range:
		velocity = position.direction_to(player.position) * SPEED
		move_and_slide()

func _process(delta: float) -> void:
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


func on_player_entered(body: Node2D) -> void:
	print("I see the player")
	player_in_range = true
	player = body


func on_player_exited(body: Node2D) -> void:
	print("I don't see the player")
	player_in_range = false
	player = null
