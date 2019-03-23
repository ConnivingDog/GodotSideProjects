extends Node2D

var messages

func _ready():
	add_to_group("interface")
	update_pointer_position(0)
	$TutorialGUI/Popup.show()

func update_pointer_position(number):
	var pointer = $ObjectivePointer
	var marker = $ObjectiveMarkers.get_child(number)
	var messages = get_from_json(Global.tutorial_messages)
	$TutorialGUI/Popup/Label.text = messages[str(number)]
	$Tween.interpolate_property(pointer, "position", pointer.position, marker.position,
			0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()
	$AudioStreamPlayer.play()

func _on_ObjectiveMove_body_entered(body):
	update_pointer_position(1)

func _on_ObjectiveDoor_body_entered(body):
	update_pointer_position(2)


func _on_ObjectiveNightVision_body_entered(body):
	update_pointer_position(3)
	DarkVision_mode()


func _on_BriefCase_body_entered(body):
	update_pointer_position(4)
	
func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	file.close()
	return parse_json(text)

func NightVision_mode():
	$TutorialGUI/Popup.hide()
	
func DarkVision_mode():
	$TutorialGUI/Popup.show()
	
