extends Area2D

func _on_SpikeTop_body_entered(body) -> void:
	# Calls method hurt in all the nodes in the group GameState
	get_tree().call_group("GameState", "hurt")
