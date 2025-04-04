extends Node3D

@export var mi : MeshInstance3D

func _physics_process(delta: float) -> void:
	var cam := $Camera3D
	var mousePos := get_viewport().get_mouse_position()

	var rayStart :Vector3= cam.project_ray_origin(mousePos)
	var direction :Vector3= cam.project_ray_normal(mousePos)

	var spaceState := get_world_3d().direct_space_state

	var p := PhysicsRayQueryParameters3D.create(rayStart,rayStart + direction*100.0 )
	var result := spaceState.intersect_ray(p)
	if result:
		mi.global_position = result.position

