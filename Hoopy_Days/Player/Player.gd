extends KinematicBody2D

const SPEED : int = 1500
const GRAVITY : int = 500
const UP := Vector2(0,-1)
const JUMP_SPEED = 5000
const WORLD_LIMIT = 4000
const BOOST_MULTIPLIER = 1.5

var motion : = Vector2()
var lives : = 3

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	
func apply_gravity():
	if position.y > WORLD_LIMIT:
		end_game()
	if not is_on_floor():
		motion.y += GRAVITY
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y = 0
		
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$jumpSFX.play()

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)

func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED
	lives -= 1
	$painSFX.play()
	if lives < 0:
		end_game()
		
func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED*BOOST_MULTIPLIER
	
func end_game():
	get_tree().change_scene("res://Scenes/Levels/GameOver.tscn")