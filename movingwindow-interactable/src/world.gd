extends Node2D

#func _ready() -> void:
var offset := Vector2.ONE


func _physics_process(delta: float) -> void:
	$Icon.global_position = get_global_mouse_position()
	get_window().mouse_passthrough = false
	get_window().mouse_passthrough_polygon = getPolygon()
	if Input.is_action_just_pressed("lClick"):
		$Polygon2D.global_position
		$Polygon2D.modulate = Color(randf(),randf(),randf(),0.4)
		print("hello")

	if Input.is_action_just_pressed("rClick"):
		offset = get_global_mouse_position() - $Polygon2D.global_position
	if Input.is_action_pressed("rClick"):
		$Polygon2D.global_position =  get_global_mouse_position() - offset

func getPolygon() -> PackedVector2Array:
	var a := []
	for point in $Polygon2D.polygon:
		a.append(point + $Polygon2D.global_position  )
	var pv2a := PackedVector2Array(a)
	return pv2a
