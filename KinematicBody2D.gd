extends KinematicBody2D

var motion = Vector2()
var velocity = Vector2()
var phy_g = 300
var walkSpeed = 70
var jumpHeight = 100
 
func _physics_process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	motion.y = motion.y+phy_g*delta
	if is_on_floor():
		if Input.is_action_pressed("ui_down"):
			$Stand.play("Sit")
		else :
			if Input.is_action_pressed("ui_up"):
				motion.y = -jumpHeight
			if Input.is_action_pressed("ui_right"):
				motion.x= walkSpeed
				$Stand.flip_h = false
				$Stand.play("Run")
			elif Input.is_action_pressed("ui_left"):
				motion.x= -walkSpeed
				$Stand.flip_h = true
				$Stand.play("Run")
			else:
				motion.x = 0
				$Stand.play("Stand")

	
	move_and_slide(motion,Vector2( 0, -1 ))
	if is_on_floor():
		motion.y=0
	pass
