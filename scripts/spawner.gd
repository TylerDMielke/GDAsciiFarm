extends Node2D


var is_spawning: bool = false
var is_mouse_in_game_map: bool = false


func _ready():
	Globals.spawn_entity.connect(_on_spawn_entity)
	Globals.mouse_entered_game_map.connect(func (): is_mouse_in_game_map = true)
	Globals.mouse_exited_game_map.connect(func (): is_mouse_in_game_map = false)


func _process(_delta):
	if is_spawning and is_mouse_in_game_map:
		var game_map: Node2D = get_parent().get_node("GameMap")
		var mouse_position: Vector2i = game_map.get_mouse_position(get_global_mouse_position())
		game_map.update_foreground(mouse_position, game_map.TILES.STRAIGHT_FACE, Color.CHARTREUSE)


func _on_spawn_entity(type: Globals.ENTITY):
	StateManager.update_input_state.emit(StateManager.INPUT_STATE.SPAWN)
	is_spawning = true
	print_debug("Spawning Entity: {0}".format([Globals.ENTITY.keys()[type]]))
