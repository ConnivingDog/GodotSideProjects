extends "res://Scripts/Character.gd"

const FOV_TOLERANCE = 20
const COLOR_WARNING_RED = "#d13f3f"
const COLOR_SAFE_WHITE = "#ffffff"

onready var Player = get_node("/root/Level1/Player")

func _process(delta):
	Player_is_in_FOV_TOLERANCE()

func Player_is_in_FOV_TOLERANCE():
	var NPC_facing_direction = Vector2(1,0).rotated(global_rotation)
	var direction_to_Player = (Player.position - global_position).normalized()
	
	if abs(direction_to_Player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLERANCE):
		$Torch.color = COLOR_WARNING_RED
	else:
		$Torch.color = COLOR_SAFE_WHITE

