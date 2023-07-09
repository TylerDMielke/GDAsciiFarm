extends Node2D

@onready var game_map: Node2D = $GameMap
@onready var game_ui: Control = $GameInterface
@onready var debug_message_timer: Timer = Timer.new()
@onready var test_colors: Array[Color] = [
	Color.RED,
	Color.BLUE,
	Color.GOLD,
	Color.PURPLE,
]


func _ready():
	game_map.fill_foreground(game_map.TILES.PERIOD, Color.GREEN)
	game_map.fill_background(game_map.TILES.SQUARE, Color.BLACK)
	_initialize_debug_timer()


func _process(_delta):
	var rand_point: Vector2i = Vector2i(randi_range(0, game_map.map_size.x), randi_range(0, game_map.map_size.y))
	game_map.update_foreground(rand_point, game_map.TILES.STRAIGHT_FACE, Color.RED)


func _on_debug_timer_timeout():
	# Print debug messages
	print(">>> DEBUG")
	var rand_point: Vector2i = Vector2i(randi_range(0, game_map.map_size.x), randi_range(0, game_map.map_size.y))
	var rand_color: Color = test_colors[randi_range(0, test_colors.size())-1]
	game_map.update_foreground(rand_point, game_map.TILES.STRAIGHT_FACE, rand_color)
	print("<<< DEBUG")


func _initialize_debug_timer():
	debug_message_timer.wait_time = 2.0
	debug_message_timer.timeout.connect(_on_debug_timer_timeout)
	add_child(debug_message_timer)
	debug_message_timer.start()
