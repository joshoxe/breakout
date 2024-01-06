extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_3_hearts()

func set_3_hearts():
	texture = load("res://assets/sprite/3heart.png")
	
func set_2_hearts():
	texture = load("res://assets/sprite/2heart.png")

func set_1_hearts():
	texture = load("res://assets/sprite/1heart.png")
	
func set_0_hearts():
	texture = load("res://assets/sprite/0heart.png")
