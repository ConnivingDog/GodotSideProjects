extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const UP = Vector2(0,-1)
const JUMP_SPEED = -1750
const JUMP_BOOST = 2

var motion = Vector2()

func _physics_process(delta):
	update_motion()

func _process(delta):
	update_animation(motion)
	
func update_animation(motion):
	$Sprite.update(motion)
	
func update_motion():
	fall()
	run()
	jump()
	move_and_slide(motion, UP)

func fall(delta):
	if is_on_floor() or isn_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
	
	motion.y = clamp(motion.y,(JUMP_SPEED * JUMP_BOOST), -JUMP_SPEED)
	
func run():
	
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0
		$Sprite.flip_h = false

func jump():
	if is_on_floor() and Input.is_action_pressed("ui_accept"):
		motion.y = JUMP_SPEED