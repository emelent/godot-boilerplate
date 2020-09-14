extends Node2D


func _on_Quit_pressed():
	GameManager.quit()


func _on_Controls_pressed():
	GameManager.goToScene(Global.scenes.menu_controls)


func _on_Play_pressed():
	GameManager.goToScene(Global.scenes.level_test)
