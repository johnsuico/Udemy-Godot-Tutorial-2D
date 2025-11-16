extends Node

const GAME = preload("uid://c1c81lbj2vx5p")
const MAIN = preload("uid://cmpyma78daeru")
const SIMPLE_TRANSITION = preload("uid://bpjp5rhipi6uy")

var next_scene: PackedScene

func load_game_scene() -> void:
	next_scene = GAME
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)

func load_main_scene() -> void:
	next_scene = MAIN
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
