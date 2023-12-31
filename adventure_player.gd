extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	$AnimatedSprite2D.play()
	if is_on_floor():
		$AnimatedSprite2D.animation = "running"

	# Handle Jump.
	if Input.is_action_just_pressed("adventure_player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.animation = "jumping"
		$JumpSound.play()
	
	if Input.is_action_just_pressed("adventure_player_slide"):
		look_at(position * Vector2(-1, 90))
		$AnimatedSprite2D.animation = "sliding"
	if Input.is_action_just_released("adventure_player_slide"):
		look_at(position * Vector2(90, -1))
		
	move_and_slide()


func _on_area_2d_area_entered(area):
	if (area.name == "BeastArea2D"): # beast player collision
		# removes the adventure player
		hide()
	
	else: #Obstacle collision
	# moves player right by one square grid
		position.x += 64
		
		# deletes obstacle
		area.queue_free()

func start(pos):
	position = pos
	show()
