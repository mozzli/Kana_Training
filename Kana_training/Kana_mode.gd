extends Node2D

func _on_Hiragana_pressed():
	Mode.hiragana = true
	Mode.katakana = false
	Mode.both = false
	assert(get_tree().change_scene("res://Main.tscn") == OK)

func _on_Katakana_pressed():
	Mode.katakana = true
	Mode.hiragana = false
	Mode.both = false
	assert(get_tree().change_scene("res://Main.tscn") == OK)

func _on_Both_pressed():
	Mode.both = true
	Mode.hiragana = false
	Mode.katakana = false
	assert(get_tree().change_scene("res://Main.tscn") == OK)
	

func _on_quit_pressed():
	assert(get_tree().change_scene("res://Title_screen.tscn") == OK)
