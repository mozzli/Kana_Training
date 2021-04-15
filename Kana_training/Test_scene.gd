extends Node2D
var letters = []
var correct_letter
var letter
var options

var hiragana_letter_dictionary = {"a": "あ", "e": "え", "i": "い","o": "お","u": "う","ka": "か",
	"ke": "け","ki": "き","ku": "く","ko": "こ","sa": "さ","shi": "し","su": "す","se": "せ",
	"so": "そ","ta": "た","chi": "ち","tsu": "つ","te": "て","to": "と","na": "な","ni": "に","nu": "ぬ",
	"ne": "ね","no": "の","ha": "は","hi": "ひ","fu": "ふ","he": "へ","ho": "ほ","ma": "ま","mi": "み",
	"mu": "む","me": "め","mo": "も","ya": "や","yu": "ゆ","yo": "よ","ra": "ら","ri": "り","ru": "る",
	"re": "れ","ro": "ろ","wa": "わ","wo": "を", "n": "ん", "ga": "が", "gi": "ぎ", "gu": "ぐ", "ge": "げ", "go": "ご",
	"za": "ざ", "ji": "じ", "zu": "ず", "ze": "ぜ", "zo": "ぞ", "da": "だ", "de": "で", "do": "ど",
	"ba": "ば", "bi": "び", "bu": "ぶ", "be": "べ", "bo": "ぼ", "pa" : "ぱ", "pi": "ぴ", "pu": "ぷ", "pe": "ぺ", "po": "ぽ"}

var katakana_letter_dictionary = {"a": "ア", "e": "エ", "i": "イ","o": "オ","u": "ウ","ka": "カ",
	"ke": "ケ","ki": "キ","ku": "ク","ko": "コ","sa": "サ","shi": "シ","su": "ス","se": "セ",
	"so": "ソ","ta": "タ","chi": "チ","tsu": "ツ","te": "テ","to": "ト","na": "ナ","ni": "ニ","nu": "ヌ",
	"ne": "ネ","no": "ノ","ha": "ハ","hi": "ヒ","fu": "フ","he": "ヘ","ho": "ホ","ma": "マ","mi": "ミ",
	"mu": "ム","me": "メ","mo": "モ","ya": "ヤ","yu": "ユ","yo": "ヨ","ra": "ラ","ri": "リ","ru": "ル",
	"re": "レ","ro": "ロ","wa": "ワ","wo": "ヲ", "n": "ン", "ga": "ガ", "gi": "ギ", "gu": "グ", "ge": "ゲ", "go": "ゴ",
	"za": "ザ", "ji": "ジ", "zu": "ズ", "ze": "ゼ", "zo": "ゾ", "da": "ダ", "de": "デ", "do": "ド",
	"ba": "バ", "bi": "ビ", "bu": "ブ", "be": "ベ", "bo": "ボ", "pa" : "パ", "pi": "ピ", "pu": "プ", "pe": "ペ", "po": "ポ"}
	
var ten_ten_transformation = {"ka": "ga", "ki": "gi", "ku": "gu", "ke": "ge", "ko": "go",
	"sa": "za", "shi": "ji", "su": "zu", "se": "ze", "so": "zo", "ta": "da", "te": "de", "to": "do",
	"ha": "ba", "hi": "bi", "fu": "bu", "he": "be", "ho": "bo"}
	
var maru_transformation = {"ha": "pa", "hi": "pi", "fu": "pu", "he": "pe", "ho": "po"}

func appending_letters():
	for i in Mode.mode:
		letters.append(i)
		if Mode.ten_ten == true && ten_ten_transformation.has(i):
			letters.append(ten_ten_transformation[i])
		if Mode.maru == true && maru_transformation.has(i):
			letters.append(maru_transformation[i])

func show_letter(selected_letter):
	if Mode.hiragana == true:
		$Label.text = hiragana_letter_dictionary[selected_letter]
	elif Mode.katakana == true:
		$Label.text = katakana_letter_dictionary[selected_letter]
	elif Mode.both == true:
		randomize()
		var roll = randi() % 2
		if roll == 1:
			$Label.text = hiragana_letter_dictionary[selected_letter]
		else:
			$Label.text = katakana_letter_dictionary[selected_letter]

func rolling_letter():
	options = ["1","2"]
	letters.clear()
	appending_letters()
	randomize()
	letter = letters[randi() % letters.size()] 
	show_letter(letter)
	correct_letter = letter
	
func button_setting():
	while options.empty() == false:
		var button_number = options[randi() % options.size()]
		get_node("Button" + button_number).text = letter
		letters.erase(letter)
		letter = letters[randi() % letters.size()] 
		options.erase(button_number)

func _ready():
	var transition_out = load("res://Shader3.tscn")
	add_child(transition_out.instance())
	rolling_letter()
	button_setting()


func button_pressing(button_number):
	if get_node("Button" + String(button_number)).text == correct_letter:
		var tick = preload("res://tick.tscn")
		var ticker = tick.instance()
		add_child(ticker)
		ticker.position = Vector2(360, 760)
	else:
		var cross_preload = preload("res://cross.tscn")
		var cross_instance = cross_preload.instance()
		add_child(cross_instance)
		cross_instance.position = Vector2(360, 760)
	rolling_letter()
	button_setting()
	
func _on_Button1_pressed():
	button_pressing(1)

func _on_Button2_pressed():
	button_pressing(2)

func _on_quit_pressed():
	assert(get_tree().change_scene("res://Main.tscn") == OK)
