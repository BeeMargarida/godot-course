extends Node2D

var timeout : bool = false

func _process(delta: float) -> void:
	if $Sprite/RayCast2D.is_colliding():
		fire()
		
func fire() -> void:
	if not timeout:
		$Sprite/RayCast2D.add_child(load("res://NPCs/Lightining.tscn").instance())
		$Sprite/Timer.start()
		timeout = true

func _on_Timer_timeout() -> void:
	timeout = false
