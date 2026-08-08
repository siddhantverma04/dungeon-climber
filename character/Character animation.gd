extends AnimatedSprite2D

func _on_ready() -> void:	# Connect the signal that triggers whenever an animation changes
	animation_changed.connect(_on_animation_changed)

func _on_animation_changed():
	# Replace "shrink_animation" with your actual animation name
	if animation == "CLimb":
		scale = Vector2(0.5, 0.5) # Scale down for this animation only
	else:
		scale = Vector2(1.0, 1.0) # Reset to normal size for all other animations
