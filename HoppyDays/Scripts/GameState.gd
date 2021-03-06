extends Node

var starting_lives = 3
var coin_target = 20
var lives
var coins = 0

onready var GUI = Global.GUI

var screen_size = OS.get_screen_size()
var window_size = OS.get_window_size()

func _ready():
	OS.set_window_position(screen_size*0.5 - window_size*0.5) #screen
	Global.GameState = self 
	lives = starting_lives
	update_GUI()
	
func update_GUI():
	GUI.update_GUI(lives, coins)

func animate_GUI(animation):
	GUI.animate(animation)

func hurt():
	lives -= 1
	Global.Player.hurt()
	update_GUI()
	animate_GUI("Hurt")
	if lives < 0:
		end_game()

func coin_up():
	coins += 1
	update_GUI()
	animate_GUI("CoinPulse")
	var multiple_of_coin_target = (coins % coin_target) == 0
	if multiple_of_coin_target:
		life_up()
		
func life_up():
	lives += 1
	update_GUI()
	animate_GUI("LifePulse")

func end_game():
	get_tree().change_scene(Global.GameOver)

func win_game():
	get_tree().change_scene(Global.Victory)

func _on_Portal_body_entered(body):
	win_game()
