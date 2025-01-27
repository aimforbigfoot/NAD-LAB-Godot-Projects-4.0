extends Node2D
@onready var p :Path2D= $Path2D
var curve := Curve2D.new()
var pressed := false
var initalPos := Vector2.ZERO
var lastKnownPosOfMouse := Vector2.ZERO
var listOfPoints := []

var d1 := 0.0
var mouseTimer := 0.0

func _ready() -> void:
	GlobalSignals.MouseEnteredDot.connect(updateLinePoints)

func updateLinePoints(p) -> void:
	if pressed:
		listOfPoints.append(p)
		var diff :Vector2= p - get_global_mouse_position()
		print(p, diff)
		curve.add_point(p, -diff, diff )

func updateTimers(delta) -> void:
	d1 += 1
	if d1 > 40:
		d1 = 0

	mouseTimer += delta
	if mouseTimer > 1.0:
		mouseTimer = 0
		lastKnownPosOfMouse = get_global_mouse_position()

func _process(delta: float) -> void:
	updateTimers(delta)
	var lastKnonwDirOfMouse :Vector2= get_global_mouse_position() - lastKnownPosOfMouse
	if Input.is_action_just_pressed("mb1"):
		curve.clear_points()
		$Line2D.global_position = Vector2.ZERO
		curve.add_point(Vector2.ZERO)
		curve.add_point(Vector2.ONE)
		pressed = true
		initalPos = get_global_mouse_position()
		curve.set_point_position( 0, initalPos    )
	if Input.is_action_just_released("mb1"):
		pressed = false
		#curve.clear_points()
		var tween := get_tree().create_tween()
		#tween.tween_property($Line2D, "global_position", Vector2(500, $Line2D.global_position.y), 1.0).set_trans(Tween.TRANS_EXPO)
		listOfPoints.clear()
	if pressed:
		curve.set_point_position( curve.point_count-1, get_global_mouse_position() )
		$Line2D.points = curve.tessellate()

		var fakeI := 1
		if d1 <= 35:
# Assuming 'd1' is defined and incremented elsewhere in your code
# Assuming 'd1' is defined and incremented elsewhere in your code

			for point in listOfPoints:
				curve.set_point_position(fakeI, point + randVec())

				if d1 < 28:
					# Apply small random movement to 'in' and 'out' handles
					var current_in = curve.get_point_in(fakeI)
					var current_out = curve.get_point_out(fakeI)
					var random_movement_in = Vector2(randf_range(-1, 1), randf_range(-1, 1))
					var random_movement_out = Vector2(randf_range(-1, 1), randf_range(-1, 1))
					curve.set_point_in(fakeI, current_in + random_movement_in)
					curve.set_point_out(fakeI, current_out + random_movement_out)
				elif d1 == 28:
					# Assign new random positions to 'in' and 'out' handles
					var new_in = Vector2(randf_range(-10, 10), randf_range(-10, 10))
					var new_out = Vector2(randf_range(-10, 10), randf_range(-10, 10))
					curve.set_point_in(fakeI, new_in)
					curve.set_point_out(fakeI, new_out)
					# Reset d1 to 0 to repeat the cycle
					d1 = 0

				fakeI += 1



func randVec() -> Vector2: return Vector2( randf_range(-1,1), randf_range(-1,1) ) /2
func getRandSmartVec(lastKnonwDirOfMouse:Vector2, accPos, currPos, flip ) -> Vector2:
	var r := Vector2.ZERO
	var dd :Vector2= currPos - accPos
	var d :float= (currPos - accPos).length()
	print(d)
	var a := randf()
	if a < 0.4:
		#r += randVec() + accPos
		pass
	#elif a < 0.8:
		#r -= randVec() - currPos
	else:
		r = dd
	return r.normalized()

