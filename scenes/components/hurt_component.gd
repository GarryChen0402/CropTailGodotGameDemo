extends Area2D
class_name HurtComponent

@export var tool: DataTypes.Tool = DataTypes.Tool.AxeWood

signal hurt


func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent
	print("current tool : ", hit_component.current_tool, " tool : ", tool)
	if tool == hit_component.current_tool:
		print("hurt")
		hurt.emit(hit_component.hit_damage)
