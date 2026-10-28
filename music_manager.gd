extends Node

@onready var win_music: AudioStreamPlayer2D = $"win music"
@onready var mountain_music: AudioStreamPlayer2D = $"mountain music"
@onready var music: AudioStreamPlayer2D = $music

var current_tween: Tween
# Transitions to mountain music from whatever is currently playing
func transition_to_mountain_music(fade_time: float = 1.0) -> void:
	_crossfade_from_current(mountain_music, fade_time)

# Transitions to regular music from whatever is currently playing
func transition_to_regular_music(fade_time: float = 1.0) -> void:
	_crossfade_from_current(music, fade_time)

# Transitions to win music from whatever is currently playing
func transition_to_win_music(fade_time: float = 1.0) -> void:
	_crossfade_from_current(win_music, fade_time)

# Call this function to fade out and stop ALL music safely
func stop_all_music(fade_time: float = 1.0) -> void:

	# Cancel an old transition first
	if current_tween != null and current_tween.is_valid():
		current_tween.kill()

	var all_players = [music, mountain_music, win_music]

	current_tween = create_tween()
	current_tween.set_parallel(true)

	for player in all_players:
		if player.playing:
			current_tween.tween_property(
				player,
				"volume_db",
				-80.0,
				fade_time
			)

	current_tween.finished.connect(
		func():
			for player in all_players:
				player.stop()
	)
	
func _crossfade_from_current(to_player: AudioStreamPlayer2D, duration: float) -> void:

	# Cancel any old music transition
	if current_tween != null and current_tween.is_valid():
		current_tween.kill()

	if not is_instance_valid(to_player):
		return

	var all_players = [music, mountain_music, win_music]

	# Make sure the target music is playing
	if not to_player.playing:
		to_player.volume_db = -80.0
		to_player.play()

	current_tween = create_tween()
	current_tween.set_parallel(true)

	# Fade target music in
	current_tween.tween_property(
		to_player,
		"volume_db",
		0.0,
		duration
	)

	# Fade every other track out
	for player in all_players:
		if player != to_player and player.playing:
			current_tween.tween_property(
				player,
				"volume_db",
				-80.0,
				duration
			)

	# When THIS transition finishes, stop the other tracks
	current_tween.finished.connect(
		func():
			for player in all_players:
				if player != to_player:
					player.stop()
	)
	
