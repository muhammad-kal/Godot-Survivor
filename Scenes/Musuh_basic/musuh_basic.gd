extends CharacterBody2D

@export var kecepatan_musuh = 75

var node_player

func _ready() -> void:
	node_player = get_tree().get_first_node_in_group("player")
	
func _physics_process(delta: float) -> void:
	lokasi_player()
	jalan_ke_player()
	
func lokasi_player():
	if node_player :
		var lokasi_player = (node_player.global_position - global_position).normalized()
		print(lokasi_player)
		return lokasi_player
	return Vector2.ZERO
	
func jalan_ke_player():
	var arah_ke_player = lokasi_player()
	velocity = arah_ke_player * kecepatan_musuh 
	move_and_slide()
