extends CanvasLayer

func update_score(player, score):
	var score_label = get_node("Banner/HBoxContainer/Player%sScore" % player)
	score_label.text = str(score)

func game_over(player_id):
	var popup_label = $Popup/VBoxContainer/Label
	popup_label.text = "Player %s wins!" % player_id
	$Popup.popup_centered()

func _on_Button_pressed():
	get_tree().reload_current_scene()
