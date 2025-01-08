extends Node2D
signal mouseWasUnpressed
var pressed := false
var arrOfDotsGlidedOver := []
func _ready() -> void:
	var allTheDots := get_parent().get_node("DotGridHolder").get_children()
	for dot in allTheDots:
		dot.connect("mouseEnteredDot", addAPointToOurLine)

func addAPointToOurLine(posPassedInFromEmitSignalInOtherScript, dotName) -> void:
	if pressed:
		print(posPassedInFromEmitSignalInOtherScript)
		$Line2D.add_point(posPassedInFromEmitSignalInOtherScript, $Line2D.get_point_count()-1)
		arrOfDotsGlidedOver.append(dotName)

func updateMouseStateasjdfklasdf() -> void:
	if Input.is_action_just_pressed("click"):
		$Line2D.add_point(get_global_mouse_position(),0)
		$Line2D.add_point(get_global_mouse_position(),1)
		$Line2D.add_point(get_global_mouse_position(),2)
		pressed = true
	if Input.is_action_just_released("click"):
		mouseWasUnpressed.emit()
		pressed = false
		$Line2D.clear_points()
		print(arrOfDotsGlidedOver)
		arrOfDotsGlidedOver.clear()

func _process(delta: float) -> void:
	updateMouseStateasjdfklasdf()
	if pressed:
		var lastPointIndex :int= $Line2D.get_point_count()-1
		$Line2D.points[lastPointIndex] = get_global_mouse_position()
