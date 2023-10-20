extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# moves the obstacle
	var velocity =  10
	position.x += velocity

func _on_visible_on_screen_notifier_2d_screen_exited():
	# deletes obstacle after it leaves the screen
	queue_free()
