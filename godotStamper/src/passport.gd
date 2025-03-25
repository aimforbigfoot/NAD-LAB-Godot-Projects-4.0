extends Node2D

var ot := Vector2.ZERO
var mouseEnteredSDFDF := false

func _ready() -> void:
	$Area2D.mouse_entered.connect(onMouseEntersdioafasdjf)
	$Area2D.mouse_exited.connect(onMosueExit)

func onMouseEntersdioafasdjf() -> void:
	mouseEnteredSDFDF = true

func onMosueExit() -> void:
	mouseEnteredSDFDF = false

func _input(event: InputEvent) -> void:

	if Input.is_action_just_pressed("rightClick") and mouseEnteredSDFDF:
		print("right click got")
		spawnStamp()

	if Input.is_action_just_pressed("leftClick"):
		ot = global_position - get_global_mouse_position()

	if Input.is_action_pressed("leftClick") and mouseEnteredSDFDF:
		global_position = get_global_mouse_position() + ot

func spawnStamp() -> void:
	var stamp := preload("res://src/stamp.tscn").instantiate()
	add_child(stamp)
	stamp.global_position = get_global_mouse_position()
