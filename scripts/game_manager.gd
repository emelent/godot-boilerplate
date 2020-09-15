extends Node


const MAX_PLAYERS = 4

var player_inputs = {}
var player_ids = [0, 1, 2, 3]


# OVERRIDES
func _ready():
	# limit Godot's cpu usage (this stops my cpu from going brrrr)
	OS.set_low_processor_usage_mode(true)
#    Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _input(event):
	if OS.is_debug_build() and event.is_action_pressed("debug_quit") :
		quit()

# CUSTOM 

func add_player(input):
	if not player_inputs.has(input) and player_inputs.size() < MAX_PLAYERS:
		player_inputs[input] = player_ids.pop_front()

func remove_player(input):
	player_ids.push_back(player_inputs[input])
	player_inputs.erase(input)
	player_ids.sort()

func get_player_id(input):
	return player_inputs[input]

func get_player_name(input):
	return "Player %d" % get_player_number(input)

func get_player_number(input):
	return (player_inputs[input] + 1)

func num_players():
	return player_inputs.size()
	
func goToScene(path):
	return get_tree().change_scene(path)


func quit():
	get_tree().quit()
