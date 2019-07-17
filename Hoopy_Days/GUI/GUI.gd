extends CanvasLayer

func _ready() -> void:
	$Control/TextureRect/HBoxContainer/LifeCount.text = "3"
	
func update_gui(livesLeft: int, coins: int) -> void:
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(livesLeft)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
	