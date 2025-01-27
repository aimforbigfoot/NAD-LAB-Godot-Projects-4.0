extends Area2D

var isMouseIn := false
var isPressed := false

func _ready() -> void:
	mouse_entered.connect( func(): isMouseIn = true )
	mouse_exited.connect(  handleMouseExitasdcjikljasdf )

func handleMouseExitasdcjikljasdf() -> void:
	if !isPressed:
		isMouseIn = false


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("click") and isMouseIn:
		isPressed = true
	else:
		isPressed = false


	if isPressed == true:
		global_position = get_global_mouse_position()
