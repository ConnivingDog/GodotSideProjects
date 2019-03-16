extends "res://Scripts/Door.gd"

var combination = [4,1,5]

onready var lock = $CanvasLayer/NumberPad

func _ready():
	$CanvasLayer/NumberPad.combination = combination

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		lock.popup_centered()
		
func _input(event):
	if Input.is_action_just_pressed("ui_interact") and can_click:
		lock.popup_centered()
		
func open():
	$AnimationPlayer.play("open")
	lock.reset_lock()
	lock.hide()
		
func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false
		lock.reset_lock()
		lock.hide()
