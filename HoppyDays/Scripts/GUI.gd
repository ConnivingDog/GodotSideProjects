extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(lives):
	$Banner/HBoxContainer/LifeCount.text = "0" + str(lives)
