extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(lives, coins):
	$Banner/HBoxContainer/LifeCount.text = "0" + str(lives)
	$Banner/HBoxContainer/CoinCount.text = "0" + str(coins)
