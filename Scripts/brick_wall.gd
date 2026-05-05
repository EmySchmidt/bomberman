extends Area2D

class_name BrickWall

@onready var animbrick: AnimatedSprite2D = $AnimatedSprite2D

const POWER_UP_SCENE = preload("res://Scenes/powersUp.tscn")
	
@export var power_up_res = PowerUpres

func destroy():
	animbrick.play("destroy")
	
func on_animated_sprite_2d_animation_finished() -> void:
	if animbrick.animation == "destroy":
		queue_free()
		
func spawn_power_up():
	var power_up = POWER_UP_SCENE.instantiate()
	power_up.global_position = global_position
	get_tree().root.add_child(power_up)
	power_up.init(power_up_res)
