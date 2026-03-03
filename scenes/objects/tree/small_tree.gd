extends Sprite2D
@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var wood_scene = preload("res://scenes/objects/wood.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(on_max_damaged_reached)
	
func on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter("shake_intensity", 0.5)
	await  get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity", 0.0)

func on_max_damaged_reached() -> void:
	call_deferred("add_wood_scene")
	print("max damaged reached")
	
	queue_free()
	
func add_wood_scene() -> void:
	var wood_instance = wood_scene.instantiate() as Node2D
	wood_instance.global_position = global_position
	get_parent().add_child(wood_instance)
