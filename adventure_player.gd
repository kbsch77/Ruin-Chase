extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("adventure_player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("adventure_player_slide"):
		pass
		
	move_and_slide()


func _on_area_2d_area_entered(area):
	hide()
	
	position.x += 64

# might need to change as a timed "grace period"
func _on_area_2d_area_exited(area):
	show()
