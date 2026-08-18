extends Node
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player_2d.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Main.tscn")
	MusicManager.transition_to_regular_music(2.0)


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Main menu.tscn")
	MusicManager.transition_to_mountain_music(2.0)
