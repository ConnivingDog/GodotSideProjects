extends "res://Scripts/Character.gd"

const FOV_TOLERANCE = 20
const MAX_DETECTION_RANGE = 320
const COLOR_WARNING_RED = "#d13f3f"
const COLOR_SAFE_WHITE = "#ffffff"

onready var Player = get_node("/root/Level1/Player")

func _process(delta):
	if Player_is_in_FOV_TOLERANCE() and Player_is_in_LOS():
		$Torch.color = COLOR_WARNING_RED
	else:
		$Torch.color = COLOR_SAFE_WHITE

func Player_is_in_FOV_TOLERANCE():
	var NPC_facing_direction = Vector2(1,0).rotated(global_rotation)
	var direction_to_Player = (Player.position - global_position).normalized()
	
	if abs(direction_to_Player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false

func Player_is_in_LOS():
	var space = get_world_2d().direct_space_state
	var LOS_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	
	var distance_to_player = Player.global_position.distance_to(global_position)
	var Player_in_range = distance_to_player < MAX_DETECTION_RANGE
	
	if LOS_obstacle.collider == Player and Player_in_range:
		return true
	else:
		return false

