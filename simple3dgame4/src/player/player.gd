extends CharacterBody3D

const SPEED :float= 30.0
const GRAV := -4.0
const JUMP_STRENGTH := 50.0
var vel := Vector3.ZERO

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		vel.y += GRAV
	else:
		vel.y = 0 
	
	if Input.is_action_just_pressed("jump"):
		vel.y = JUMP_STRENGTH
	
	var playerInput := getPlayerInputs() * SPEED
	vel.x = playerInput.x
	vel.z = playerInput.z
	
	velocity = vel 
	move_and_slide()


func getPlayerInputs() -> Vector3:
	var r:= Vector3.ZERO
	r.x = Input.get_action_strength("right") - Input.get_action_strength("left") 
	r.z = Input.get_action_strength("backward") - Input.get_action_strength("foward") 
	return r






