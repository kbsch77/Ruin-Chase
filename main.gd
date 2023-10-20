extends Node
@export var obstacle_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$ObstacleTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_obstacle_timer_timeout():
	# Create a new instance of the obstacle scene.
	var obstacle = obstacle_scene.instantiate()

	# Choose a random location on Path2D.
	var obstacle_spawn_location = get_node("ObstaclePath/ObstacleSpawnLocation")
	obstacle_spawn_location.progress_ratio = randf()

	# Set the obstacle's direction perpendicular to the path direction.
	var direction = obstacle_spawn_location.rotation + PI / 2

	# Set the obstacle's position to a random location.
	obstacle.position = obstacle_spawn_location.position

	# Spawn the obstacle by adding it to the Main scene.
	add_child(obstacle)


func _game_over_adventurer():
	pass
	
func _game_over_beast():
	pass
