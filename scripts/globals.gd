extends Node


enum ENTITY {
    TRACTOR,
    PLOW,
    PLANTER,
}


signal spawn_entity(entity_type: ENTITY)


var grid_size: Vector2i = Vector2i(16, 16)