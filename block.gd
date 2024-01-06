extends StaticBody2D

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	# body_entered.connect(on_body_entered)
	pass
	
func destroy():
	hit.emit()
	queue_free()

func get_size():
	return $CollisionShape2D.shape.extents
