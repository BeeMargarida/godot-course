extends "res://Scripts/Character.gd"

const FOV_TOLERANCE : int = 22
const RED: Color = Color(1,.25,.25)
const WHITE : Color = Color(1,1,1)

onready var Player : Node = get_node("/root/Level1/Player") # Make this level neutral

func _process(delta: float) -> void:
	if Player_is_in_FOV_TOLERANCE():
		$Torch.color = RED
	else:
		$Torch.color = WHITE
	
func Player_is_in_FOV_TOLERANCE() -> bool:
	var NPC_facing_direction : Vector2 = Vector2(1,0).rotated(global_rotation) # direction the NPC is facing
	var direction_to_Player : Vector2 = (Player.position - global_position).normalized()
	
	if abs(direction_to_Player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	return false