extends XRController3D

@export var labelImModding : Label3D
var isTopPressed := false
var isGripped := false

func _ready() -> void:
	button_pressed.connect(btnPressed)
	button_released.connect(btnReleased)


func btnPressed(btnName:String) -> void:
	if btnName == "trigger_touch":
		isTopPressed = true
	if btnName == "grip_click":
		isGripped = true

func btnReleased(btnName:String) -> void:

	if btnName == "trigger_touch":
		isTopPressed = false

	if btnName == "grip_click":
		isGripped = false

func _physics_process(delta: float) -> void:
	if isTopPressed and isGripped:
		labelImModding.text = "fist"
	elif isGripped:
		labelImModding.text = "pointing "
	else:
		labelImModding.text = "open hand"

