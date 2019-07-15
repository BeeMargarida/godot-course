extends Control

var player_words : = []

var current_story : Dictionary

onready var PlayerText : = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText : = $VBoxContainer/DisplayText


func _ready() -> void:
	set_current_story()
	DisplayText.text = "Welcome to Loony Lips! We're going to tell a story and tell a wonderful time! "
	check_player_words_length()
	PlayerText.grab_focus()

func set_current_story() -> void:
	var stories : = get_from_json("StoryBook.json")
	randomize()
	current_story = stories[randi() % stories.size()]
	
func get_from_json(filename: String) -> Array:
	var file : File = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	
	return data

func _on_PlayerText_text_entered(new_text: String) -> void:
	add_to_player_words()

func _on_TextureButton_pressed() -> void:
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

func add_to_player_words() -> void:
	if PlayerText.text == "":
		return
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	PlayerText.grab_focus()
	check_player_words_length()

func is_story_done() -> bool:
	return player_words.size() == current_story.prompts.size()

func check_player_words_length() -> void:
	if is_story_done():
		end_game()
	else:
		prompt_player()

func tell_story() -> void:
	DisplayText.text = current_story.story % player_words

func prompt_player() -> void:
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"

func end_game() -> void:
	PlayerText.queue_free() # remove element from memory
	$VBoxContainer/HBoxContainer/Label.text = "Again!"
	tell_story()


