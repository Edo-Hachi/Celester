extends Node2D

@export var velocity = Vector2.ZERO
@export var max_run = 100
@export var run_accel = 800

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	var direction = sign(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))

	if direction > 0:
		$AnimatedSprite2d.flip_h = false
	elif direction < 0:
		$AnimatedSprite2d.flip_h = true

	if direction != 0:
		$AnimatedSprite2d.play("Run")
	else:
		$AnimatedSprite2d.play("Idle")


	velocity.x = move_toward(velocity.x, max_run * direction, run_accel * delta)
	global_position.x += velocity.x * delta

