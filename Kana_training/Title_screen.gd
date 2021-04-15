extends Node2D

func _on_Button_pressed():
	assert(get_tree().change_scene("res://Kana_mode.tscn") == OK)


func _on_Button2_pressed():
	assert(get_tree().change_scene("res://Kanji_test_scene.tscn") == OK)
