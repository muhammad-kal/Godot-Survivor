extends Node

@export var Area_Serangan : float = 150
@export var Serangan : PackedScene

func _ready() -> void:
	$Timer.timeout.connect(timer_timeout)
	
func _process(delta: float) -> void:
	pass

func timer_timeout():
	var node_player : Node2D = get_tree().get_first_node_in_group("player")
	var musuh_musuh = get_tree().get_nodes_in_group("musuh")
	
	if !node_player :
		return
		
	musuh_musuh.filter(func(musuh:Node2D): 
		return  musuh.global_position.distance_squared_to(node_player.global_position) < pow(Area_Serangan,2)
	)
	
	if musuh_musuh.size() == 0:
		return
	
	musuh_musuh.sort_custom(func(a:Node2D, b:Node2D):
		var posisi_a = a.global_position.distance_squared_to(node_player.global_position)
		var posisi_b = b.global_position.distance_squared_to(node_player.global_position)
		return posisi_a < posisi_b
	)
	
	var serangan_instance = Serangan.instantiate()
	node_player.get_parent().add_child(serangan_instance)
	serangan_instance.global_position = musuh_musuh[0].global_position
