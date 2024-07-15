extends CharacterBody3D

const GRAV := -1.0
const JUMP_FORCE := 10.0
const SPEED := 10.0
var vel : Vector3 = Vector3.ZERO

func _ready() -> void:
	pass

func getInputs() -> void:
	vel.x = (Input.get_action_strength("right") - Input.get_action_strength("left"))* SPEED
	vel.z =( Input.get_action_strength("backward") - Input.get_action_strength("foward")) * SPEED
	

func _physics_process(delta: float) -> void:
	getInputs()
	if not is_on_floor():
		vel.y += GRAV
	if Input.is_action_just_pressed("jump"):
		vel.y = JUMP_FORCE
	velocity = vel
	
	move_and_slide()
	print(velocity)
