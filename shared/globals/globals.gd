extends Node

const tile_scene: PackedScene = preload("res://scenes/tile/tile.tscn")
const entity_scene: PackedScene = preload("res://scenes/entity/entity.tscn")

var tile_size: Vector2i = Vector2(32,32)
var grid_size: Vector2i = Vector2(16,16)
var hovered_tile_coors:Vector2i= Vector2(-1,-1)
var selected_tile_coors:Vector2i= Vector2(-1,-1)
