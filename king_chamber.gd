extends Area2D
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body._king_speech()
		run_dialogue("king")



func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
