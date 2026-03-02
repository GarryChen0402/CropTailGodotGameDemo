class_name Player
extends CharacterBody2D

@export var current_tool: DataTypes.Tool = DataTypes.Tool.None

var player_direction: Vector2


func get_facing_direction() -> String:
	var facing: String = "front"
	if player_direction == Vector2.LEFT: facing = "left"
	elif player_direction == Vector2.RIGHT: facing = "right"
	elif player_direction == Vector2.UP: facing = "back"
	elif player_direction == Vector2.DOWN: facing = "front"
	
	return facing
