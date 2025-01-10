extends CharacterBody2D

@export var kecepatan = 50

var player_node 

func _ready() -> void:
	$Hitbox.area_entered.connect(mati)
	player_node = get_tree().get_first_node_in_group("player")
	
func _physics_process(delta: float) -> void:
	velocity = set_posisi_player() * kecepatan
	move_and_slide()
	
func set_posisi_player():
	if player_node:
		var posisi_player
		posisi_player = (player_node.global_position - global_position).normalized()
		return posisi_player
		
func mati(area_musuh : Area2D):
	queue_free()
		
