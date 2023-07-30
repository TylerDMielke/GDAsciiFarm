extends Node


enum ENTITY {
    TRACTOR,
    PLOW,
    PLANTER,
}


signal spawn_entity(entity_type: ENTITY)

## The mouse entered the gamemap.
signal mouse_entered_game_map

## The mouse exited the gamemap.
signal mouse_exited_game_map


var grid_size: Vector2i = Vector2i(16, 16)