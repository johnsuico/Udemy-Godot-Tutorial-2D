extends Area2D

const PADDLESPEED: float = 500.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# This controls movement
	# Create a float variable called "movement"
	# Input.get_axis for left and right movement
		# Will return a -1, 0 , +1
			# -1 (left), 0 (don't move), +1 (right)
			# Multiply thaat by paddle speed and delta to dictate if it's negative or position indicating either to move left or right
	var movement: float = Input.get_axis("move_left", "move_right")
	position.x += PADDLESPEED * delta * movement
	
	# This controls player position to stay on the screen
	# Keep value to be constrained in between the min and max values
	position.x = clampf(
		position.x,							# Value to be constrained
		get_viewport_rect().position.x,		# Value minimum = 0
		get_viewport_rect().end.x			# Value maximum = Edge of viewport, 1152.0 in this case but could vary depending on size of viewport
	)


#func _on_area_entered(area: Area2D) -> void:
	#print('Something hit the paddle')
