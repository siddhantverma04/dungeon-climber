extends Node
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var control_next_button: Button = $"Control next button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	animation_player.play("new_animation")
	

	

func _on_control_next_button_pressed() -> void:
	animation_player.play("how to play")


func _on_how_to_play_next_pressed() -> void:
	animation_player.play("start")
	timer.start()
	
	
	

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
