extends Node
class_name StateMachine

var state = null setget set_state
var previous_state = null
var states = {}

signal state_changed

func add_state(state_name):
	states[state_name] = states.size()

func get_state_name(state):
	for state_name in states:
		if states[state_name] == state:
			return state_name
	return null

func set_state(new_state):
	previous_state = state
	state = new_state
	emit_signal("state_changed",  get_state_name(new_state))

	if previous_state != null:
		__exit_state(previous_state, state)

	__enter_state(state, previous_state)

func __get_next_state(delta):
	return null

func __enter_state(new_state, old_state):
	pass

func __exit_state(old_state, new_state):
	pass
