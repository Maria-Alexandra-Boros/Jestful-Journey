extends KinematicBody2D

const ACCELERATION = 4000
const MAX_SPEED = 35000
const FRICTION = 1000

var velocity = Vector2.ZERO

onready var animation = $Sprite

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength( "ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength( "ui_up")
	input_vector = input_vector.normalized( )
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED *delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION *delta)
	velocity= move_and_slide(velocity)

	if Input.is_action_pressed("ui_right"):
		animation.play("right")
	elif Input.is_action_pressed("ui_left"):
		animation.play("left")
	elif Input.is_action_pressed("ui_up"):
		animation.play("up")
	elif Input.is_action_pressed("ui_down"):
		animation.play("down")
	else:
		animation.play("idle")
		

