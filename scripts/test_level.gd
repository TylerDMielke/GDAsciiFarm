extends Node2D

@onready var game_map: Node2D = $GameMap
@onready var game_ui: MarginContainer = $Sidebar
@onready var debug_message_timer: Timer = Timer.new()


func _ready():
	game_map.fill_foreground(game_map.TILES.PERIOD, game_map.TILE_COLOR.GREEN)
	game_map.fill_background(game_map.TILES.SQUARE, game_map.TILE_COLOR.BLACK)
	_initialize_debug_timer()


func _process(_delta):
	pass


func _on_debug_timer_timeout():
	# Print debug messages
	print(">>> DEBUG")
	print("Test Level Children:")
	for child in get_children():
		print("{0}".format([child]))
	print("<<< DEBUG")


func _initialize_debug_timer():
	debug_message_timer.wait_time = 2.0
	debug_message_timer.timeout.connect(_on_debug_timer_timeout)
	add_child(debug_message_timer)
	debug_message_timer.start()
