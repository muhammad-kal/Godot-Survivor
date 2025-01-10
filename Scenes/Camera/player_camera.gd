extends Camera2D

var player_node 
var lokasi_player

func _ready() -> void:
	player_node = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	kamera_ke_player()
	
func kamera_ke_player():
	if player_node :
		lokasi_player = player_node.global_position
		#global_position = global_position.lerp(lokasi_player, 1.0 - pow(-delta ,10))
		global_position = lerp(global_position, lokasi_player,get_physics_process_delta_time() * 15)
