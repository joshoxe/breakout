extends Node

var blocks = [
	preload("res://block_1.tscn"),
	preload("res://block_2.tscn"),
	preload("res://block_3.tscn"),
	preload("res://block_4.tscn"),
	preload("res://block_5.tscn"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	var screen_size = DisplayServer.window_get_size()
	var block_width = 100
	var w_padding = 10
	var block_height = 25
	var h_padding = 10
	var h_count = floor((screen_size.x - w_padding) / (block_width + w_padding))
	var total_width = h_count * (block_width + w_padding) - w_padding
	var x_start = (screen_size.x - total_width) / 2
	var y_placement = 100

	for block in blocks:
		for i in range(h_count):
			var block_instance = block.instantiate()
			block_instance.position = Vector2(x_start + (i * (block_width + w_padding)) + block_width / 2, y_placement + block_height / 2)
			$BlockContainer.add_child(block_instance)
		y_placement += block_height + h_padding
