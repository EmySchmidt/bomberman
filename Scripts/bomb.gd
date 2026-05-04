extends Area2D

class_name Bomb
signal on_bomb_exploded

var explosion_size = 1

func _on_timer_timeout() -> void:
	queue_free()
	on_bomb_exploded.emit()
# adicionando forma
