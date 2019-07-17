extends Node2D

var lives : int = 3
var coins : int = 0
var target_number_of_coins = 10

func _ready() -> void:
	add_to_group("GameState")
	update_GUI()

func hurt() -> void:
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives < 0:
		end_game()

func update_GUI() -> void:
	get_tree().call_group("GUI", "update_gui", lives, coins)

func coin_up() -> void:
	coins += 1
	update_GUI()
	var multiple_of_coins : bool = (coins % target_number_of_coins) == 0
	if multiple_of_coins:
		life_up()
		
func life_up() -> void:
	lives += 1
	update_GUI()

func end_game() -> void:
	get_tree().change_scene("res://Scenes/Levels/GameOver.tscn")
	
func win_game() -> void:
	get_tree().change_scene("res://Scenes/Levels/Victory.tscn")
