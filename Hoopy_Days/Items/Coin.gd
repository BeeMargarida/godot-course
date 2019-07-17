extends Node2D

var taken : bool = false

func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if not taken:
		taken = true
		$AnimationPlayer.play("die")
		$AudioStreamPlayer.play()
		get_tree().call_group("GameState", "coin_up")

func die() -> void:
	queue_free()