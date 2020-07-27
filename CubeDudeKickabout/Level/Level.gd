extends Spatial

var player1_score = 0
var player2_score = 0

export var target_score = 3

func update_score(player_id):
	var new_score
	
	match player_id:
		1:
			player1_score += 1
			new_score = player1_score
		2:
			player2_score += 1
			new_score = player2_score
	
	$GUI.update_score(player_id, new_score)
	check_game_over(player_id, new_score)
	
func check_game_over(player_id, score):
	if score == target_score:
		$Timer.queue_free()
		$GUI.game_over(player_id)
	

func _on_GoalDetector_body_entered(body, player_id):
	if body.get_name() != "Ball": return
	get_tree().call_group("game_pieces", "freeze", player_id)
	$Timer.start()
	update_score(player_id)
	$Airhorn.play()

func _on_Timer_timeout():
	get_tree().call_group("game_pieces", "reset")
