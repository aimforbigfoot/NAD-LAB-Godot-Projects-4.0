extends Area2D

signal mouseEnteredDot
var wasConnected := false


func _ready() -> void:
	connect("mouse_entered", sdjifadfasdfioasdjfio)
	connect("mouse_exited", mouseLeftDot)
	get_parent().get_parent().get_node("mouseLine").connect("mouseWasUnpressed", resetWasConnectedFunc)

func sdjifadfasdfioasdjfio() -> void:
	if not wasConnected and Input.is_action_pressed("click"):
		wasConnected = true
		var tween := get_tree().create_tween()
		tween.tween_property($Icon, "scale", Vector2(1.1,1.1), 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
		emit_signal("mouseEnteredDot", global_position, name)
	
func mouseLeftDot() -> void:
	var tween := get_tree().create_tween()
	tween.tween_property($Icon, "scale", Vector2.ONE, 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
	
func resetWasConnectedFunc() -> void:
	wasConnected = false
