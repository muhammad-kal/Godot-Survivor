extends CharacterBody2D

@export var Kecepatan = 150

const AKSELERASI  = 25

func _physics_process(delta: float) -> void:
	var input_kontrol = get_vektor_input()
	var normalize_input_kontrol = input_kontrol.normalized()
	var kecepatan_target = normalize_input_kontrol * Kecepatan
	velocity = velocity.lerp(kecepatan_target, 1 - exp(-delta * AKSELERASI))
	move_and_slide()
	
func get_vektor_input():
	var pergerakan_horizontal = Input.get_action_strength("kanan") - Input.get_action_strength("kiri")
	var pergerakan_vertikal = Input.get_action_strength("bawah") - Input.get_action_strength("atas")
	return Vector2(pergerakan_horizontal, pergerakan_vertikal)
