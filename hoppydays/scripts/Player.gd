extends KinematicBody2D

var motion = Vector2()
var friction
#floor normal (up direction) default value
const UP = Vector2(0,-1)
const GRAVITY = 75
const ACCELERATION = 150
const MAX_SPEED = 750
const JUMP_HEIGHT = -1750

func _physics_process(delta):
	update_motion()
	
func _process(delta):
	update_animation(motion)

func update_motion():
	fall()
	run()
	#resets motion when collides
	motion = move_and_slide(motion,UP)

func update_animation(motion):
	$Sprite.update(motion)
	
func fall():
	motion.y += GRAVITY
	friction = false
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		#if motion.y < 0:
		#	$Sprite.play("Jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)

func run():
	#check project settings for keys associated with the ff actions
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		motion.x -= ACCELERATION
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
	
