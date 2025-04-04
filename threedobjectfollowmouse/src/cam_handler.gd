extends Node3D

@export var mi : MeshInstance3D

func _physics_process(delta: float) -> void:
	var cam := $Camera3D
	var mousePos := get_viewport().get_mouse_position()
	print(mousePos)

	var rayStart :Vector3= cam.project_ray_origin(mousePos)
	var direction :Vector3= cam.project_ray_normal(mousePos)

	var plane := Plane(Vector3.UP)

	var intersection = plane.intersects_ray(rayStart,direction)
	print(intersection)

	if intersection:
		mi.global_position.x = intersection.x
		mi.global_position.z = intersection.z
