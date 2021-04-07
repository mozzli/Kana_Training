extends Node2D

# Checked modes variants setup
var mode_a = false
var mode_k = false
var mode_s = false
var mode_t = false
var mode_n = false
var mode_h = false
var mode_m = false
var mode_y = false
var mode_r = false
var mode_w = false
var mode_en = false

#Full "Checked modes" array setup
var mode_full = []

#Mode buttons functions
func _on_Button_a_pressed():
#	mode letters setup
	var Button_a_letters = ["a","i","u","e","o"]
#	selected button check
	mode_a = not mode_a
	if mode_a == true:
#		setting green outline for checked button
		$Button_a.get("custom_fonts/font").outline_size = 10
#		appending letters to mode_full array
		for letter in Button_a_letters:
			mode_full.append(letter)
	else:
#		turning outline off
		$Button_a.get("custom_fonts/font").outline_size = 0
#		removing letters from mode_full array
		for letter in Button_a_letters:
			mode_full.erase(letter)

func _on_Button_k_pressed():
	var Button_k_letters = ["ka","ki","ku","ke","ko"]
	mode_k = not mode_k
	if mode_k == true:
		$Button_k.get("custom_fonts/font").outline_size = 10
		for letter in Button_k_letters:
			mode_full.append(letter)
	else:
		$Button_k.get("custom_fonts/font").outline_size = 0
		for letter in Button_k_letters:
			mode_full.erase(letter)

func _on_Button_s_pressed():
	var Button_s_letters = ["sa","shi","su","se","so"]
	mode_s = not mode_s
	if mode_s == true:
		$Button_s.get("custom_fonts/font").outline_size = 10
		for letter in Button_s_letters:
			mode_full.append(letter)
	else:
		$Button_s.get("custom_fonts/font").outline_size = 0
		for letter in Button_s_letters:
			mode_full.erase(letter)

func _on_Button_t_pressed():
	var Button_t_letters = ["ta","chi","tsu","te","to"]
	mode_t = not mode_t
	if mode_t == true:
		$Button_t.get("custom_fonts/font").outline_size = 10
		for letter in Button_t_letters:
			mode_full.append(letter)
	else:
		$Button_t.get("custom_fonts/font").outline_size = 0
		for letter in Button_t_letters:
			mode_full.erase(letter)

func _on_Button_n_pressed():
	var Button_n_letters = ["na","ni","nu","ne","no"]
	mode_n = not mode_n
	if mode_n == true:
		$Button_n.get("custom_fonts/font").outline_size = 10
		for letter in Button_n_letters:
			mode_full.append(letter)
	else:
		$Button_n.get("custom_fonts/font").outline_size = 0
		for letter in Button_n_letters:
			mode_full.erase(letter)

func _on_Button_h_pressed():
	var Button_h_letters = ["ha","hi","fu","he","ho"]
	mode_h = not mode_h
	if mode_h == true:
		$Button_h.get("custom_fonts/font").outline_size = 10
		for letter in Button_h_letters:
			mode_full.append(letter)
	else:
		$Button_h.get("custom_fonts/font").outline_size = 0
		for letter in Button_h_letters:
			mode_full.erase(letter)

func _on_Button_m_pressed():
	var Button_m_letters = ["ma","mi","mu","me","mo"]
	mode_m = not mode_m
	if mode_m == true:
		$Button_m.get("custom_fonts/font").outline_size = 10
		for letter in Button_m_letters:
			mode_full.append(letter)
	else:
		$Button_m.get("custom_fonts/font").outline_size = 0
		for letter in Button_m_letters:
			mode_full.erase(letter)

func _on_Button_y_pressed():
	var Button_y_letters = ["ya","yu","yo"]
	mode_y = not mode_y
	if mode_y == true:
		$Button_y.get("custom_fonts/font").outline_size = 10
		for letter in Button_y_letters:
			mode_full.append(letter)
	else:
		$Button_y.get("custom_fonts/font").outline_size = 0
		for letter in Button_y_letters:
			mode_full.erase(letter)

func _on_Button_r_pressed():
	var Button_r_letters = ["ra","ri","ru","re","ro"]
	mode_r = not mode_r
	if mode_r == true:
		$Button_r.get("custom_fonts/font").outline_size = 10
		for letter in Button_r_letters:
			mode_full.append(letter)
	else:
		$Button_r.get("custom_fonts/font").outline_size = 0
		for letter in Button_r_letters:
			mode_full.erase(letter)

func _on_Button_w_pressed():
	var Button_w_letters = ["wa","wo"]
	mode_w = not mode_w
	if mode_w == true:
		$Button_w.get("custom_fonts/font").outline_size = 10
		for letter in Button_w_letters:
			mode_full.append(letter)
	else:
		$Button_w.get("custom_fonts/font").outline_size = 0
		for letter in Button_w_letters:
			mode_full.erase(letter)

func _on_Button_en_pressed():
	var Button_en_letters = ["n"]
	mode_en = not mode_en
	if mode_en == true:
		$Button_en.get("custom_fonts/font").outline_size = 10
		for letter in Button_en_letters:
			mode_full.append(letter)
	else:
		$Button_en.get("custom_fonts/font").outline_size = 0
		for letter in Button_en_letters:
			mode_full.erase(letter)

#accept button function
func _on_Accept_button_pressed():
#	preparing Autoload for test scene
	Mode.mode = mode_full
	print(Mode.mode)
#	loading test scene
	get_tree().change_scene("res://Test_scene.tscn")
