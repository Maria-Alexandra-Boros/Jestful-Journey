extends Area2D

func _on_galeata_body_entered(body):
	if body.name == "Player":
		queue_free()
		print("You picked up the bucket!")
		var hasBucket = true
		
const ACCELERATION =460
const MAX_SPEED =225
var velocity =Vector2.ZERO
var item_name

func _ready():
	item_name = "galeata"
func _physics_process(delta):
	velocity=  velocity.move_toward(Vector2(0,MAX_SPEED),ACCELERATION * delta)
