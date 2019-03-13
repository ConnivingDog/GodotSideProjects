extends "res://Scripts/Door.gd"

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/NumberPad.popup_centered()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and can_click:
		$CanvasLayer/NumberPad.popup_centered()
