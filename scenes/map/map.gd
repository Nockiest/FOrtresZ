extends Node2D
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_debug_window()
	
	
func update_debug_window():
	$DebugWindow/VBoxContainer/MousePosition.text = 'X:' + str( get_global_mouse_position().x ) + ' Y:' + str( get_global_mouse_position().y ) 
#	print(Globals.hovered_tile_coors)
	if (Globals.hovered_tile_coors):
		$DebugWindow/VBoxContainer/GridPosition.text = 'X:' + str( Globals.hovered_tile_coors.x ) + ' Y:' + str(  Globals.hovered_tile_coors.y )  
	if (Globals.selected_tile_coors):
		$DebugWindow/VBoxContainer/SelectedTileCoors.text = 'X:' + str( round(Globals.selected_tile_coors.x) ) + ' Y:' + str(  round(Globals.selected_tile_coors.y) )  
		
