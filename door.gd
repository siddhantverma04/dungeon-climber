extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer



func _on_area_entered(area: Area2D) -> void:
	animated_sprite_2d.play("Open")
	timer.start()
	
	
	
	


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
