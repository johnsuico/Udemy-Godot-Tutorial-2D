extends Node2D

# Child node references
@onready var spawn_timer: Timer = $SpawnTimer
@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point: Marker2D = $LowerPoint
@onready var pipes_holder: Node = $PipesHolder

# Scene References
const PIPES = preload("uid://bsgvy10wosw3c")

# Statics
static var _vp_r: Rect2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_vp()
	get_viewport().size_changed.connect(update_vp)
	spawn_new_pipe()
	
func update_vp() -> void:
	_vp_r = get_viewport_rect()
	
static func get_vpr() -> Rect2:
	return _vp_r

func _on_spawn_timer_timeout() -> void:
	spawn_new_pipe()

func spawn_new_pipe() -> void:
	var new_pipe: Pipes = PIPES.instantiate()
	var y_pos: float = randf_range(upper_point.position.y, lower_point.position.y)
	new_pipe.position = Vector2(_vp_r.end.x + 100, y_pos)
	pipes_holder.add_child(new_pipe)

func _on_plane_died() -> void:
	get_tree().paused = true
