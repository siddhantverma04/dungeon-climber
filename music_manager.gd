extends Node
@onready var mountain_music: AudioStreamPlayer2D = $"mountain music"

@onready var music: AudioStreamPlayer2D = $music

func transition_to_mountain_music(fade_time: float = 1.0) -> void:
	_crossfade(music, mountain_music, fade_time)

func transition_to_regular_music(fade_time: float = 1.0) -> void:
	_crossfade(mountain_music, music, fade_time)

func _crossfade(from_player: AudioStreamPlayer2D, to_player: AudioStreamPlayer2D, duration: float) -> void:
	# Ensure the target track starts playing silently
	if not to_player.playing:
		to_player.volume_db = -80.0
		to_player.play()
	
	# Create a tween to handle both volume animations simultaneously
	var tween = create_tween().set_parallel(true)
	
	# Fade out the current track
	tween.tween_property(from_player, "volume_db", -80.0, duration)
	
	# Fade in the new track
	tween.tween_property(to_player, "volume_db", 0.0, duration)
	
	# Stop the old track completely once the fade finishes
	tween.chain().tween_callback(from_player.stop)
