extends Area2D

var mission_started: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.text_signal.connect(DialogicSignal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	

func _on_body_entered(body: CharacterBody2D) -> void:
	if not mission_started:
		run_dialogue("VillagerMission")
	else:
		run_dialogue("VillagerRepeat")
	
	
func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)


func DialogicSignal(arg: String):
	if arg == "exit_villager":
		print("signal recieved")
		mission_started = true
