extends Resource
class_name MapData
## Data related to the gamemap.


# var Glyph = preload("res://scripts/glyph.gd")

## The size of the gamemap.
var size: Vector2i:
    get:
        return size

## The terrain within the gamemap.
var terrain: Array = []:
    get:
        return terrain
    set(value):
        terrain = value


func _init(parent_position: Vector2i):
    size = Vector2i((DisplayServer.window_get_size() - Vector2i(parent_position)) / Globals.GRID_SIZE)


func _ready():
    _initialize_terrain()


func fill_terrain(fill_glyph: Glyph) -> void:
    for x in range(size.x):
        var terrain_column: Array[Glyph] = []
        for y in range(size.y):
            var new_glyph: Glyph = fill_glyph.copy()
            terrain_column.append(new_glyph)
        terrain.append(terrain_column)


func _initialize_terrain() -> void:
    fill_terrain(Glyph.new(Globals.TILE_MAP_TILE_VALUES.PERIOD, Color.GREEN, Color.BLACK))
