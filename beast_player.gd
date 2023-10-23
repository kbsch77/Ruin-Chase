extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle Jump.
	if Input.is_action_just_pressed("beast_player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("beast_player_slide"):
		look_at(position * Vector2(1, -1))
	if Input.is_action_just_released("beast_player_slide"):
		look_at(position * Vector2(90, -1))

	move_and_slide()


func _on_area_2d_area_entered(area):
	# moves player right by one square grid
	position.x += 64
		
	# deletes obstacle
	area.queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	# Beast Player loses
	pass
