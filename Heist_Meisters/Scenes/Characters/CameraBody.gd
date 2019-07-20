extends "res://Scripts/Character.gd"

const FOV_TOLERANCE : int = 45

onready var Player : Node = get_node("/root/Level1/Player") # Make this level neutral

func _process(delta: float) -> void:
	Player_is_in_FOV_TOLERANCE()
	
func Player_is_in_FOV_TOLERANCE() -> void:
	var NPC_facing_direction : Vector2 = Vector2(1,0).rotated(global_rotation)
	