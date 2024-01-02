class_name Grid
extends Node2D

 
var gap_size = 0 # Gap size between rows
var grid = []

func _ready():
	initialize_grid()
#	place_entities_randomly()

func initialize_grid():
	for x in range(Globals.grid_size.x):
		var row = []
		for y in range( Globals.grid_size.y):
			var tile = create_tile(x, y)
			row.append(tile)
		grid.append(row)

func create_tile(x, y):
	var tile = Globals.tile_scene.instantiate() as Area2D
	tile.position = Vector2(x * Globals.tile_size.x, (y * Globals.tile_size.y) + (y * gap_size))
	tile.get_node('GridPositionTracker').set_grid_position(Vector2i(x, y))
	tile.get_node('BorderedColorRect').resize(Vector2i(Globals.tile_size.x - 1, Globals.tile_size.y - 1))
	add_child(tile)
	tile.connect("tile_left_clicked",  _on_tile_left_clicked )
	return tile

func _on_tile_left_clicked(tile_position):
	if  Globals.selected_tile_coors == tile_position :
		Globals.selected_tile_coors = Vector2i(-1,-1)
	else:
		Globals.selected_tile_coors = tile_position
	print(Globals.selected_tile_coors, tile_position,   Globals.selected_tile_coors == tile_position  )

 
