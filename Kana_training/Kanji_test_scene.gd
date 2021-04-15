extends Node2D

var points_dir = {"a": "あ", "e": "え", "o": "お"}
var okejka = {"a": 23, "e": 9}

func _ready():
	print(points_dir["a"])


func _on_quit_pressed():
	assert(get_tree().change_scene("res://Title_screen.tscn") == OK)
