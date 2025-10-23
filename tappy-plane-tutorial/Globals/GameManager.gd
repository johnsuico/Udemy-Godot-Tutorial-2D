extends Node

const GAME = preload("uid://c1c81lbj2vx5p")
const MAIN = preload("uid://cmpyma78daeru")


func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)
