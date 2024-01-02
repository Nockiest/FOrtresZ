extends Node

const tile_scene: PackedScene = preload("res://scenes/tile/tile.tscn")
const entity_scene: PackedScene = preload("res://scenes/entity/entity.tscn")

var tile_size: Vector2i = Vector2(32,32)
var grid_size: Vector2i = Vector2(16,16)

var hovered_tile_coors:Vector2i= Vector2(-1,-1)
var selected_tile_coors:Vector2i= Vector2(-1,-1)
var selected_entity: Entity:
	set(value):
		if value == selected_entity:
			print("They are the same. Resetting to null.")
			selected_entity = null
		else:
			print("Changing selected entity from ", selected_entity, " to ", value)
			selected_entity = value
