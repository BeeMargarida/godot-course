extends Node2D

const SPEED : int = 300

func _ready() -> void:
	# doesn't inherit position from parent
	set_as_toplevel(true)
	global_position = get_parent().global_position
	
func _process(delta: float) -> void:
	position.y += SPEED * delta
	manage_collision()
	
func manage_collision() -> void:
	var collider : Array = $Area2D.get_overlapping_bodies()
	for obj in collider:
		if obj.name == "Player":
			get_tree().call_group("GameState", "hurt")
		queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
