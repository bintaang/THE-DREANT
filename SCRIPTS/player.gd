extends CharacterBody2D

const speed = 150
var current_dir

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif  Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	else:
		play_anim(0)
		velocity.x = 0 
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("RIGHT-WALKING")
		elif movement == 0:
			anim.play("IDLE")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("RIGHT-WALKING")
		elif movement == 0:
			anim.play("IDLE")
		