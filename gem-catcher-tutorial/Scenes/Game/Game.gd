extends Node2D

# Import GEM scene
# Make sure it's a scene file (.tscn) or else you'll get errors
const GEM = preload("res://Scenes/Gem/Gem.tscn")

func _ready() -> void:
	spawn_gem()

# Functin to spawn a gem
func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()							# Create a new gem and save it into it's own var
	var x_pos: float = randf_range(0, get_viewport_rect().end.x)	# Generate the x_pos
	new_gem.position = Vector2(x_pos, -50.0)						# Give the new gem a x + y position
	new_gem.gem_off_screen.connect(_on_gem_off_scene) 				# Connect the new_gem to the signal to detect if off screen, then call a function in this scope to run
	add_child(new_gem)												# Add new_gem to the parent node (Game)

# Call timer using timeout signal
func _on_timer_timeout() -> void:
	spawn_gem()

# Function to display when called on
# Currently tied to when the gem falls off the screen
func _on_gem_off_scene() -> void:
	print('Game over')
