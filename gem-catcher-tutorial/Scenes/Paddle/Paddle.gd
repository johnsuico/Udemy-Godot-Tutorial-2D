extends Area2D

# Const variables
const SPEED: float = 400.0
const MARGIN: float = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Controlling paddle movement
	# Old method
	#if Input.is_action_pressed("move_left"):
	#	position.x -= SPEED * delta
	#if Input.is_action_pressed("move_right"):
	#	position.x += SPEED * delta
	
	# Controlling paddle movement
	# Using Input.get_axis instead, much cleaner code
	var movement: float = Input.get_axis("move_left", "move_right") # move_left would give -1 and move_right would give +1. 
	position.x += SPEED * delta * movement

	# Restrict the movement of the paddle to within the screen bounds
	# Margin is used to account for the width of the paddle, makes it stop at the paddle ends instead of the middle
	position.x = clampf(position.x, get_viewport_rect().position.x + MARGIN, get_viewport_rect().end.x - MARGIN)

# Exercise using signals
# Detect when the paddle does a collision
func _on_area_entered(_area: Area2D) -> void:
	pass
