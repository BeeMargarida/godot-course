extends Node2D



func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	get_tree().call_group("GameState", "win_game")
