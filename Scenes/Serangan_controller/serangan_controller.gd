extends Node

@export var Serangan : PackedScene

func _ready() -> void:
	$Timer.timeout.connect(timer_timeout)
	
func _process(delta: float) -> void:
	pass

func timer_timeout():
	var node_player = get_tree().get_first_node_in_group("player")
	if node_player:
		var serangan_instance = Serangan.instantiate()
		node_player.get_parent().add_child(serangan_instance)
		serangan_instance.global_position = node_player.global_position
