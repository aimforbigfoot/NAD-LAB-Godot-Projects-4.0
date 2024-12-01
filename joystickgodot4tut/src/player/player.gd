extends CharacterBody2D


func _physics_process(delta: float) -> void:
	velocity = Silly.dirFromJoyStick
	move_and_slide()
