extends Node2D
var letters = []
var correct_letter
var letter
var options

func rolling_letter():
	options = ["1","2"]
	letters.clear()
	for i in Mode.mode:
		letters.append(i)
	randomize()
	letter = letters[randi() % letters.size()] 
	get_node("Hiragana_signs/"+ letter).visible = true
	correct_letter = letter
	
func button_setting():
	while options.empty() == false:
		var button_number = options[randi() % options.size()]
		get_node("Button" + button_number).text = letter
		letters.erase(letter)
		letter = letters[randi() % letters.size()] 
		options.erase(button_number)

func _ready():
	for i in Mode.mode:
		letters.append(i)
	rolling_letter()
	button_setting()

func button_pressing(button_number):
	if get_node("Button" + String(button_number)).text == correct_letter:
		print("correct")
	else:
		print("false")
	get_node("Hiragana_signs/"+correct_letter).visible = false
	rolling_letter()
	button_setting()
	
func _on_Button1_pressed():
	button_pressing(1)

func _on_Button2_pressed():
	button_pressing(2)
