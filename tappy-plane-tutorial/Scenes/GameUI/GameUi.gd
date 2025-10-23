extends Control

#var MAIN = load("uid://cmpyma78daeru") # Commented out as no longer needed, it's in GameManager global script now

@onready var game_over_label: Label = $GameOverLabel
@onready var press_space_label: Label = $PressSpaceLabel

@onready var timer: Timer = $Timer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):                     
		#get_tree().change_scene_to_packed(MAIN) # Moved to GameManager global script
		GameManager.load_main_scene()
	elif press_space_label.visible == true and event.is_action_pressed("jump"):
		GameManager.load_main_scene()

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)


func on_plane_died() -> void:
	game_over_label.show()
	timer.start()

func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()
