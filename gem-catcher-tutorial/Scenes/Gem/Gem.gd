extends Area2D

class_name Gem

# Creating a custom signal
signal gem_off_screen

const SPEED: float = 200.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# This makes the gem fall down
	# Increase position.y so gem appears to fall down
	position.y += SPEED * delta
	
	# If position.y is greater than the viewport y, then keep falling
	# Once it hits the bottom of the viewport, stop the process
	if position.y > get_viewport_rect().end.y:
		gem_off_screen.emit() # Call custom signal when conditions above are met
		die()

# Function to avoid repetitive code
func die() -> void:
	set_process(false)		# Stops gem from falling
	queue_free()			# Removes the gem from the scene, making it disappear

func _on_area_entered(_area: Area2D) -> void:
	print('Gem hits paddle')
	die()
