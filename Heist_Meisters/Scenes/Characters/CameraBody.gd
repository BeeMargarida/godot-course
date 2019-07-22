extends "res://Scripts/Character.gd"

const FOV_TOLERANCE : int = 22
const MAX_DETECTION_RANGE : int = 320
const RED: Color = Color(1,.25,.25)
const WHITE : Color = Color(1,1,1)

onready var Player : Node = get_node("/root/Level1/Player") # Make this level neutral

func _process(delta: float) -> void:
	if Player_is_in_FOV_TOLERANCE() and Player_is_in_LOS():
		$Torch.color = RED
	else:
		$Torch.color = WHITE
	
func Player_is_in_FOV_TOLERANCE() -> bool:
	var NPC_facing_direction : Vector2 = Vector2(1,0).rotated(global_rotation) # direction the NPC is facing
	var direction_to_Player : Vector2 = (Player.position - global_position).normalized()
	
	if abs(direction_to_Player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	return false

func  Player_is_in_LOS():
	var space : Physics2DDirectSpaceState = get_world_2d().direct_space_state
	var LOS_obstacle : Dictionary = space.intersect_ray(global_position, Player.global_position, [self])
	var distance_to_player : float = Player.global_position.distance_to(global_position)
	var Player_in_range : bool = distance_to_player < MAX_DETECTION_RANGE
	
	if LOS_obstacle.collider == Player and Player_in_range:
		return true
	return false