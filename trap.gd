extends Area2D
@onready var timer = $Timer

@onready var game_manager: Node = $"../../Game manager"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		game_manager.decrease_health()
