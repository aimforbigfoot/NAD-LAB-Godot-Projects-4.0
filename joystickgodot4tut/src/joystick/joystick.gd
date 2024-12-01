extends Node2D


var diff : Vector2 = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("click"):
		$Marker2D.global_position = get_global_mouse_position()
		diff = $Marker2D.global_position - self.global_position
		print(diff, diff.normalized())
	if Input.is_action_just_released("click"):
		$Marker2D.global_position = self.global_position
		diff = Vector2.ZERO
	Silly.dirFromJoyStick = diff
