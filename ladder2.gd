extends Area2D
@onready var animation_player_2 = $AnimationPlayer2
@onready var character_body_2d = $"."

func _on_body_entered(character_body_2d):
	animation_player_2.play("ladder 2")
