extends Node2D

class_name Game

# Load the GEM scene / refer to it
const GEM = preload("uid://bmyvhk527gvw4")
const EXPLODE = preload("uid://c3btbgswv8c0r")

# Referencing to spawn_timer instance in the 'Game' scene
@onready var spawn_timer: Timer = $SpawnTimer
@onready var paddle: Area2D = $Paddle
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var background_music: AudioStreamPlayer = $BackgroundMusic
@onready var score: Label = $Score

# Cache view port size to prevent calling it every frame
# Static vars can be called anywhere including the children nodes
static var _vp_r: Rect2

# Score var
var game_score: int = 0

# Function that executes the moment game is run
func _ready() -> void:
	update_vp()
	get_viewport().size_changed.connect(update_vp)
	spawn_gem()

# Update the view port size by getting the view port
func update_vp() -> void:
	_vp_r = get_viewport_rect()
	
# Getter function for vpr
# Also make it available everywhere
static func get_vpr() -> Rect2:
	return _vp_r

# Signal to detect if something hits the paddle
# From game scene connected to paddle scene to detect collision
# Signal is connected to paddle instance. Not all or future paddles
func _on_paddle_area_entered(area: Area2D) -> void:
	game_score += 1
	score.text = "%03d" % game_score # Formats it so that it always shows 3 digits (000, 001, etc)
	if score_sound.playing == false: # Used to make sure sounds to over lap each other
		score_sound.position = area.position # Used to position 2D sound. Doesn't really matter for this project
		score_sound.play()

# Exercise to use custom signals
# Only applicable to the single instance of a gem. Does not work for all gems
# UPDATE: Now connected to spawn_gem which connects it to any new gems that spawn
func _on_gem_off_screen() -> void:
	stop_all()

# Connected to timer instance
func _on_timer_timeout() -> void:
	spawn_gem()

# Function to spawn a gem randomly
func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()
	var x_pos: float = randf_range(get_vpr().position.x, get_vpr().end.x)
	new_gem.position = Vector2(x_pos, -50.0)
	new_gem.gem_off_screen.connect(_on_gem_off_screen) # New gem is connected to gem_off_screen signal from GEM which calls on _on_gem_off_scene function
	add_child(new_gem)

# Function to stop the game / GAME OVER
func stop_all() -> void:
	background_music.stop() # Stop background music
	background_music.stream = EXPLODE # Replace background music with EXPLODE SFX
	background_music.play() # Play the EXPLODE SFX
	spawn_timer.stop()
	for child in get_children():
		if child is Gem:
			child.set_process(false)
			
	paddle.set_process(false)
