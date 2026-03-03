extends Area2D
class_name HitComponent

@export var current_tool: DataTypes.Tool = DataTypes.Tool.None
@export var hit_damage: int = 1

@onready var player: Player = $".."


func _physics_process(_delta: float) -> void:
	current_tool = player.current_tool
