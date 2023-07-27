extends Node


signal update_input_state(new_state: INPUT_STATE)


enum INPUT_STATE {
	SPAWN,
	DEFAULT,
}


var _current_state: INPUT_STATE = INPUT_STATE.DEFAULT


func _ready():
	update_input_state.connect(_on_update_input_state)


func _on_update_input_state(new_state: INPUT_STATE):
	_current_state = new_state


func get_current_input_state():
	return _current_state
