class_name Tile
extends Area2D
#
 
signal tile_left_clicked(coors)
signal tile_right_clicked(coors)
func _on_mouse_entered() -> void:
	Globals.hovered_tile_coors = $GridPositionTracker.get_grid_position()

func _ready() -> void:
 
	var center = Utils.get_collision_shape_center(self)
	print(center)
	$entityContainer.position =  Globals.tile_size / Vector2i(2,2)#to_local(center) 
	add_entity_to_tile( )
#
func _process(event) -> void:
	var is_hovered =  Globals.hovered_tile_coors == $GridPositionTracker.get_grid_position()
	if Input.is_action_just_pressed("left_mouse_click") and is_hovered:
		emit_signal("tile_left_clicked",$GridPositionTracker.get_grid_position() )
	elif Input.is_action_just_pressed("right_mouse_click") and is_hovered:
		emit_signal("tile_right_clicked",$GridPositionTracker.get_grid_position() )

func add_entity_to_tile( ):
	if randf() <= 0.2:  # 20% chance
		var entity = Globals.entity_scene.instantiate() as Node2D
		$entityContainer.add_child_node(entity)

func _on_entity_container_entities_changed(_new_size) -> void:
	$BorderedColorRect/Fill.color = Color('red')
