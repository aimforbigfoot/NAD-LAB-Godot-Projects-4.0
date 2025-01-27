extends Area2D

signal mouseEnteredADot
var hasBeenPassedThrough := false

func _ready() -> void:
	connect("mouse_entered", mouseItselfEntered)
	connect("mouse_exited", mouseItselfExited)

func mouseItselfEntered() -> void:
	if Input.is_action_pressed("mb1") and not hasBeenPassedThrough:
		$AudioStreamPlayer.pitch_scale = randf_range(0.9, 1.1)
		$AudioStreamPlayer.play()
		$Sprite2D.texture = load("res://assets/tile_0189.png")
		hasBeenPassedThrough = true
		GlobalSignals.MouseEnteredDot.emit( global_position  )
		var tween := get_tree().create_tween()
		tween.tween_property( $Sprite2D, "scale", Vector2(1.4,1.4), 0.1 ).set_trans(Tween.TRANS_EXPO)
	elif hasBeenPassedThrough:
		$AudioStreamPlayer.pitch_scale = randf_range(0.15, 0.35)
		$AudioStreamPlayer.play()
		var tween := get_tree().create_tween()
		tween.tween_property( $Sprite2D, "scale", Vector2(1.1,1.1), 0.1 ).set_trans(Tween.TRANS_EXPO)


func mouseItselfExited() -> void:
	var tween := get_tree().create_tween()
	tween.tween_property( $Sprite2D, "scale", Vector2(0.9,0.9), 0.1 ).set_trans(Tween.TRANS_EXPO)
	tween.tween_property( $Sprite2D, "scale", Vector2(1,1), 0.25 ).set_trans(Tween.TRANS_SPRING)

func _process(delta: float) -> void:
	if Input.is_action_just_released("mb1"):
		$Sprite2D.texture = load("res://assets/tile_0196.png")
		hasBeenPassedThrough = false
