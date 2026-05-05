extends Area2D

class_name DirectionExplosion


func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		(area as Player).die()
