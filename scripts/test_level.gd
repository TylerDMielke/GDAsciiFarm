extends Node2D

@onready var game_map: Node2D = $GameMap
@onready var game_ui: Control = $GameInterface
@onready var debug_message_timer: Timer = Timer.new()


func _ready():
	_initialize_debug_timer()


func _process(_delta):
	pass


func _on_debug_timer_timeout():
	# Print debug messages
	print(">>> DEBUG")
	var current_state = StateManager.get_current_input_state()
	var current_state_name = StateManager.INPUT_STATE.keys()[current_state]
	print("Current Input State: {0}".format([current_state_name]))
	print("<<< DEBUG")


func _initialize_debug_timer():
	debug_message_timer.wait_time = 5.0
	debug_message_timer.timeout.connect(_on_debug_timer_timeout)
	add_child(debug_message_timer)
	debug_message_timer.start()
