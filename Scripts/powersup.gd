extends Area2D

class_name PowerUp

@onready var sprite_2d: Sprite2D = $Sprite2D

var type: Utils.PowerUpType

func init(power_up_res: PowerUpres):
	sprite_2d.texture = power_up_res.texture
	type = power_up_res.type
