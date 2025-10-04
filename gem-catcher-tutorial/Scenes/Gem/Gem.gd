extends Area2D

class_name Gem

# Custom signal
signal gem_off_screen

# CONSTANTS
const SPEED: float = 200.0	# Speed of falling gem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Makes the gem fall down
	position.y += SPEED * delta
	
	if position.y > Game.get_vpr().end.y:
		gem_off_screen.emit()
		die()

# Signal to detect if the GEM hits something
# Class level (GEM) detection, not connected to main game scene
# Signal is connected to Gem
func _on_area_entered(_area: Area2D) -> void:
	die()

func die() -> void:
	set_process(false)
	queue_free()
