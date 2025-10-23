extends Node2D

class_name Pipes

@onready var laser: Area2D = $Laser

const SCROLL_SPEED: float = 120.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= SCROLL_SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	set_process(false)
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		SignalHub.emit_on_point_scored()
