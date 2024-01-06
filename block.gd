extends Area2D

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(on_body_entered)
	
func on_body_entered(body):
	if body.name == "Ball":
		hit.emit()
		queue_free()
