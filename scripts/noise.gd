extends Sprite

var tree_preload = preload("res://models/tree.tscn")
var player_exited_main = false
var chunk
var created_chunk = false

func _ready():
	var noise = OpenSimplexNoise.new()
	randomize()
	noise.seed = randi()
	noise.octaves = 2
	noise.period = 149
	noise.persistence = 0
	$".".texture.noise = noise
	for node in get_children():
		if node.is_in_group("tree"):
			remove_child(node)
			node.remove_from_group("tree")
			node.queue_free()

	for i in range(-8, 8):
		for j in range(-8, 8):
			if noise.get_noise_2d(i * 64, j * 64) < -0.2:
				var tree = tree_preload.instance()
				$".".add_child(tree)
				tree.transform.origin.x = i * 32 + 6
				tree.transform.origin.y = j * 32 + 6

func player_went_down(body):
	global.new_chunk_direction = "down"

# warning-ignore:unused_argument
func player_went_up(body):
	global.new_chunk_direction = "up"

# warning-ignore:unused_argument
func player_went_right(body):
	global.new_chunk_direction = "right"

# warning-ignore:unused_argument
func player_went_left(body):
	global.new_chunk_direction = "left"

# warning-ignore:unused_argument
# warning-ignore:function_conflicts_variable
func player_exited_main(body):
	if not created_chunk:
		created_chunk = true
		chunk = duplicate()
		player_exited_main = true
		get_parent().add_child(chunk)

		if global.new_chunk_direction == "down":
			chunk.global_position.x = $".".global_position.x
			chunk.global_position.y = $".".global_position.y + 512

		if global.new_chunk_direction == "up":
			chunk.global_position.x = $".".global_position.x
			chunk.global_position.y = $".".global_position.y - 512

		if global.new_chunk_direction == "left":
			chunk.global_position.x = $".".global_position.x - 512
			chunk.global_position.y = $".".global_position.y

		if global.new_chunk_direction == "right":
			chunk.global_position.x = $".".global_position.x + 512
			chunk.global_position.y = $".".global_position.y

func player_exited(_body):
	if player_exited_main:
		$".".queue_free()
