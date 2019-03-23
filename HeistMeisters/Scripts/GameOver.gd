extends CanvasLayer

func _on_Restart_pressed():
	get_tree().change_scene(Global.level1)

func _on_Quit_pressed():
	get_tree().change_scene(Global.splash_screen)
