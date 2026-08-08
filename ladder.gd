extends Area2D
@onready var animation_player = $AnimationPlayer
@onready var character_body_2d = $"."

func _on_body_entered(character_body_2d):
	animation_player.play("ladder")
