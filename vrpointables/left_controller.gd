extends XRController3D
var activePointedObject = null
func _ready() -> void:
	connect("button_pressed", btnPressedOnLeftCntrler)
	connect("button_pressed", btnReleasedOnLeftCntrlerasdfsdf)

func _physics_process(delta: float) -> void:
	if $RayCast3D.is_colliding():
		var c = $RayCast3D.get_collider()
		activePointedObject = c
	else:
		activePointedObject = null

func btnPressedOnLeftCntrler(name:String) -> void:
	print(name)
	if name == "trigger_click":
		if activePointedObject:
			activePointedObject.queue_free()

func btnReleasedOnLeftCntrlerasdfsdf(name:String) -> void:
	if name == "trigger_click":
		pass
