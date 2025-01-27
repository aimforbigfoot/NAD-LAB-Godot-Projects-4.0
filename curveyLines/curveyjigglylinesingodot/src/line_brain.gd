extends Node2D

@export var lineHolderNodeThing : Node2D

var arrOfDraggables := []

func _ready() -> void:
	arrOfDraggables = lineHolderNodeThing.get_children()
	makeCurveyLine()

func _physics_process(delta: float) -> void:
	makeCurveyLine()

func makeCurveyLine() -> void:
	$Line2D.clear_points()
	var c2d := Curve2D.new()
	for draggable in arrOfDraggables:
		var pointInSpace :Vector2=draggable.global_position

		if draggable.get_child_count() == 3:
			var inPoint :Vector2= draggable.get_child(1).global_position - draggable.global_position
			var outPoint :Vector2= draggable.get_child(2).global_position - draggable.global_position
			c2d.add_point(pointInSpace, inPoint, outPoint)
		elif draggable.get_child_count() == 2:
			var inPoint :Vector2= draggable.get_child(1).global_position - draggable.global_position
			c2d.add_point(pointInSpace, inPoint)
		else:
			c2d.add_point(pointInSpace, Vector2.ONE*100)
	var arrOfCurvedPoints := c2d.get_baked_points()
	for point in arrOfCurvedPoints:
		$Line2D.add_point(point)







func setUpLinearLine() -> void:
	$Line2D.clear_points()
	for draggable in arrOfDraggables:
		var pointOfDragable : Vector2 = draggable.global_position
		$Line2D.add_point(pointOfDragable)
