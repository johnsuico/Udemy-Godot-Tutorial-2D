extends CharacterBody2D

class_name Tappy

# Getting the built in gravity value from project settings
var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")

# Create plane died signal
signal plane_died

# Get the animation player. Using it for the jump animation
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Reference the animated_sprite_2d
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Constant for jump velocity
const JUMP_POWER: float = -350.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Use this function anytime you make any physics related changes
func _physics_process(delta: float) -> void:
	fly(delta)
	
	# This moves the characterbody2d node using the velocity
	move_and_slide()
	
	if is_on_floor():
		die()

func fly(delta: float) -> void:
	velocity.y += _gravity * delta
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_POWER # Change velocity when space is pressed to make the plane jump
		animation_player.play("Jump")

func die() -> void:
	plane_died.emit()
	animated_sprite_2d.stop()
	set_physics_process(false)
