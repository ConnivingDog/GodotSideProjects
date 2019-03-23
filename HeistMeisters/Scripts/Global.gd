extends Node

var Player
var navigation
var destinations

var current_level = "res://Scenes/Levels/Level1.tscn"

# Scene Links

var splash_screen = "res://Scenes/Levels/SplashScreen.tscn"
var level1 = "res://Scenes/Levels/Level1.tscn"
var tutorial = "res://Scenes/Levels/Tutorial.tscn"

# File Links

var tutorial_messages = "res://Scenes/Levels/TutorialMessages.json"

# Asset Links - manual change

var nightvision_on_sfx = "res://SFX/nightvision.wav"
var nightvision_off_sfx = "res://SFX/nightvision_off.wav" 


var red_light = "res://GFX/Interface/PNG/dotRed.png"
var green_light = "res://GFX/Interface/PNG/dotGreen.png"

var box_sprite = "res://GFX/PNG/Tiles/tile_129.png"
var player_sprite = "res://GFX/PNG/Hitman 1/hitman1_stand.png"
var player_occluder = "res://Scenes/Characters/CharacterOccluder.tres" 
var box_occluder = "res://Scenes/Characters/BoxOccluder.tres"
var briefcase_sprite = "res://GFX/Loot/suitcase.png"

