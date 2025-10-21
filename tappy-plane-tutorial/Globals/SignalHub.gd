extends Node

signal on_plane_died

# Only used to get rid of warning
# Not needed
func emit_on_plane_died() -> void:
	on_plane_died.emit()
