extends Node
@export var obstacle_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$Music.play()

"stream"
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

func _adventure_player_win():
	$ObstacleTimer.stop()
	$Hud/Title.text = "Adventurer Escapes"
	$Hud/Title.show()
	$Hud/StartButton.text = "RUN AGAIN"
	$Hud/StartButton.show()

func _beast_player_win():
	$ObstacleTimer.stop()
	$Hud/Title.text = "Beast Feasts"
	$Hud/Title.show()
	$Hud/StartButton.text = "RUN AGAIN"
	$Hud/StartButton.show()


func _on_hud_start_game():
	$AdventurePlayer.start($AdventureStartPosition.position)
	$BeastPlayer.start($BeastStartPosition.position)
	$ObstacleTimer.start()
