extends Control

#const GAME = preload("uid://c1c81lbj2vx5p") # Commented out because using GameManager global script to load
@onready var highscore_number: Label = $MarginContainer/HighscoreNumber

# Space bar will take you to the "game" scene
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):                     
		#get_tree().change_scene_to_packed(GAME) # Moved to GameManager global script
		GameManager.load_game_scene()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	highscore_number.text = "%04d" % ScoreManager.high_score
