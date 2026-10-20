extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

func _on_area_entered(area: Area2D) -> void:
	animated_sprite_2d.play("Open")
	timer.start()

func _on_timer_timeout() -> void:
	# Get the actual file path of the current running scene
	var current_scene_path = get_tree().current_scene.scene_file_path
	
	# If the current file path matches level_2, switch to the win screen
	if current_scene_path == "res://level_2.tscn":
		MusicManager.transition_to_win_music(2.0)
		get_tree().change_scene_to_file("res://win screen.tscn")
	else:
		# Otherwise (if we are on the main level), go to level 2
		get_tree().change_scene_to_file("res://level_2.tscn")
