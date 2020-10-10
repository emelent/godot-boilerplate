extends Node2D

enum PlayerInput {
	KEYBOARD = 0,
	JOYSTICK_1,
	JOYSTICK_2
}


const player_actions = {
	move_left = "move_left",
	move_right = "move_right",
	move_up = "move_up",
	move_down = "move_down",
	fire = "fire"
}

const group_names = {
	players = "players",
	projectiles = "projectiles",
	walls = "walls",
	enemies = "enemies",
	collectables = "collectables",
	objects = "objects",
	foreground = "foreground",
	hitboxes = "hitboxes",
	hurtboxes = "hurtboxes"
}


const scenes = {
	menu_main = "res://scenes/menus/main_menu/MainMenu.tscn",
	menu_controls = "res://scenes/menus/controls_menu/ControlsMenu.tscn",
	level_test = "res://scenes/levels/test/Test.tscn"
}



# global methods

func is_offscreen(rect: Rect2):
	var screen_width = get_viewport_rect().size.x
	var screen_height = get_viewport_rect().size.y

	if rect.end.x < 0 or rect.position.x > screen_width:
		return true
	if rect.end.y < 0 or rect.position.y > screen_height:
		return true

	return false

