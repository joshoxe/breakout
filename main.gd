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
	$DeathZone.death_zone_hit.connect(on_death_zone_hit)
	new_game()

func on_death_zone_hit():
	Player.game_started = false	
	if Player.lives <= 0:
		handle_player_death()
	else:
		handle_player_loss()
		
func handle_player_death():
	$Ball.reset()
	Player.score = 0
	Player.lives = 3
	$HUD.update_score(Player.score)
	$HUD.update_lives(Player.lives)
	new_game()

func handle_player_loss():
	Player.lives -= 1
	$Ball.reset()
	$HUD.update_lives(Player.lives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Player.game_started == false and Input.is_action_just_pressed("start_game"):
		start_game()
		
func start_game():
	Player.game_started = true
	$Ball.start_ball()
	
func on_block_hit():
	Player.score += 1
	$HUD.update_score(Player.score)
	check_if_all_blocks_destroyed()

func check_if_all_blocks_destroyed():
	if $BlockContainer.get_child_count() == 0:
		new_game()

func new_game():
	for block in $BlockContainer.get_children():
		block.queue_free()

	var screen_size = DisplayServer.window_get_size()
	screen_size.x -= 100
	var block_width = 100
	var w_padding = 10
	var block_height = 25
	var h_padding = 10
	var h_count = floor((screen_size.x - w_padding) / (block_width + w_padding))
	var total_width = h_count * (block_width + w_padding) - w_padding
	var x_start = (screen_size.x - total_width) / 2 + 40
	var y_placement = 100

	for block in blocks:
		for i in range(h_count):
			var block_instance = block.instantiate()
			block_instance.hit.connect(on_block_hit)
			block_instance.position = Vector2(x_start + (i * (block_width + w_padding)) + block_width / 2, y_placement + block_height / 2)
			$BlockContainer.add_child(block_instance)
		y_placement += block_height + h_padding
