extends Spatial

func _ready():
	pass

func _on_GoalDetection_body_entered(body, goal_id):
	print(str(goal_id))
