extends Node

@onready var win_music: AudioStreamPlayer2D = $"win music"
@onready var mountain_music: AudioStreamPlayer2D = $"mountain music"
@onready var music: AudioStreamPlayer2D = $music

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
	var tween = create_tween().set_parallel(true)
	var all_players = [music, mountain_music, win_music]
	
	for player in all_players:
		if is_instance_valid(player) and player.playing:
			tween.tween_property(player, "volume_db", -80.0, fade_time)
			tween.chain().tween_callback(player.stop)

# Helper function that finds any active playing music and fades it out while fading the target in
func _crossfade_from_current(to_player: AudioStreamPlayer2D, duration: float) -> void:
	# If the node doesn't exist, stop immediately to avoid crash
	if not is_instance_valid(to_player):
		return
		
	# If the target is already the only thing playing, do nothing
	if to_player.playing and to_player.volume_db >= 0.0:
		return

	# Start the target track silently
	if not to_player.playing:
		to_player.volume_db = -80.0
		to_player.play()
	
	var tween = create_tween().set_parallel(true)
	
	# Fade in the target track
	tween.tween_property(to_player, "volume_db", 0.0, duration)
	
	# Dynamically find ANY stream player that is playing and fade it out (except the target)
	var all_players = [music, mountain_music, win_music]
	for player in all_players:
		if is_instance_valid(player) and player != to_player and player.playing:
			tween.tween_property(player, "volume_db", -80.0, duration)
			tween.chain().tween_callback(player.stop)
