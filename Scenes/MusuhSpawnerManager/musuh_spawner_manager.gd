extends Node

@export var musuh : PackedScene

const JARAK_SPAWN = 380

func _ready() -> void:
	$Timer.timeout.connect(on_timer_timeout)
	
func on_timer_timeout():
	var player_node = get_tree().get_first_node_in_group("player")
	if player_node == null :
		return
		
	var arah_random = Vector2.RIGHT.rotated(randf_range(0,TAU))
	var lokasi_spawn = player_node.global_position + (arah_random * JARAK_SPAWN)

	var musuh_intance : Node2D = musuh.instantiate()
	get_parent().add_child(musuh_intance)
	musuh_intance.global_position = lokasi_spawn
	
