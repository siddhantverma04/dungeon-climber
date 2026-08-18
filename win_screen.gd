extends Node
@onready var timer: Timer = $Timer

var tween = create_tween()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	# Optional: Free the node from memory after the fade finishes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	pass


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	MusicManager.transition_to_regular_music(2.0)


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Main menu.tscn")
	MusicManager.transition_to_mountain_music(2.0)
