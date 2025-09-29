extends Node2D

# Import GEM scene
# Make sure it's a scene file (.tscn) or else you'll get errors
const GEM = preload("res://Scenes/Gem/Gem.tscn")

const MARGIN: float = 70.0

@onready var spawn_timer: Timer = $SpawnTimer
@onready var paddle: Area2D = $Paddle

func _ready() -> void:
	spawn_gem()

# Functin to spawn a gem
func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()							# Create a new gem and save it into it's own var
	var x_pos: float = randf_range(get_viewport_rect().position.x + MARGIN, get_viewport_rect().end.x - MARGIN)	 # Generate the x_pos
	new_gem.position = Vector2(x_pos, -MARGIN)						# Give the new gem a x + y position
	new_gem.gem_off_screen.connect(_on_gem_off_scene) 				# Connect the new_gem to the signal to detect if off screen, then call a function in this scope to run
	add_child(new_gem)												# Add new_gem to the parent node (Game)

# Function to stop the game
func stop_all() -> void:
	spawn_timer.stop()						# Stop the game timer
	paddle.set_process(false)				# Stop the paddle
	for child in get_children():			# For loop to get all the children of game node
		if child is Gem:					# If child is a Gem
			child.set_process(false)		# Stop the gem

# Call timer using timeout signal
func _on_timer_timeout() -> void:
	spawn_gem()

# Function to display when called on
# Currently tied to when the gem falls off the screen
func _on_gem_off_scene() -> void:
	stop_all()
