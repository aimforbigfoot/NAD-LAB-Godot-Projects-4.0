extends CharacterBody2D

var ball : CharacterBody2D

func _ready() -> void:
	ball = get_parent().get_node("ball")


func _physics_process(delta: float) -> void:
	global_position.y  = ball.global_position.y
