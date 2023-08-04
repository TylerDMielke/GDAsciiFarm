extends Resource
class_name MapData
## Data related to the gamemap.

var size: Vector2i
var terrain: Array = []

var glyph_class = preload("res://scripts/glyph.gd")


func _init(parent_position: Vector2i):
    size = Vector2i((DisplayServer.window_get_size() - Vector2i(parent_position)) / Globals.GRID_SIZE)


func _ready():
    _initialize_terrain()


func _initialize_terrain() -> void:
    for x in range(size.x):
        var terrain_column: Array[Glyph] = []
        for y in range(size.y):
            var new_glyph: Glyph = glyph_class.new(Globals.TILE_MAP_TILE_VALUES.PERIOD, Color.GREEN)
            terrain_column.append(new_glyph)
        terrain.append(terrain_column)
