extends Node2D

func _ready():
	update_pointer_position()

func update_pointer_position():
	var pointer = $ObjectivePointer
	var marker = $ObjectiveMarkers.get_child(0)
	pointer.position = marker.position
	$ObjectiveMarkers.remove_child(marker)

func _on_ObjectiveMove_body_entered(body):
	update_pointer_position()

func _on_ObjectiveDoor_body_entered(body):
	update_pointer_position()


func _on_ObjectiveNightVision_body_entered(body):
	update_pointer_position()


func _on_BriefCase_body_entered(body):
	update_pointer_position()
