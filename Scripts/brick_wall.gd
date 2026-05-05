extends Area2D

class_name BrickWall

@onready var animbrick: AnimatedSprite2D = $AnimatedSprite2D

const POWER_UP_SCENE = preload("res://Scenes/powersup.tscn")

@export var power_up_res = PowerUpres

func destroy():
	animbrick.play("destroy")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animbrick.animation == "destroy":
		queue_free()
