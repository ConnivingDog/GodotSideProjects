extends Control

func _ready():
	$TextureButton.grab_focus()

func _on_TryAgainButton_pressed():
	get_tree().change_scene(Global.Scrap)
