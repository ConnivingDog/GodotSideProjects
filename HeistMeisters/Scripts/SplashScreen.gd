extends CanvasLayer

func _on_StartButton_pressed():
	get_tree().change_scene(Global.level1)


func _on_TutorialButton_pressed():
	get_tree().change_scene(Global.tutorial)


func _on_QuitButton_pressed():
	get_tree().quit()
