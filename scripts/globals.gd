extends Node

## A request for an entity to be spawned has been made.
signal spawn_entity(entity_type: ENTITY)

## The mouse entered the gamemap.
signal mouse_entered_game_map

## The mouse exited the gamemap.
signal mouse_exited_game_map

## Entity Types
enum ENTITY {
    TRACTOR,
    PLOW,
    PLANTER,
}

enum TILE {
    GRASS,
    ROCK,
    FACE,
}

## The size of the grid in the gamemap.
var GRID_SIZE: Vector2i = Vector2i(16, 16)

## Mapping of Tile Types to their values in the Tilemap.
var TILE_MAP_TILE_VALUES = {
	"PERIOD": Vector2i(14, 2),
	"SQUARE": Vector2i(11, 13),
	"STRAIGHT_FACE": Vector2i(0, 4),
}