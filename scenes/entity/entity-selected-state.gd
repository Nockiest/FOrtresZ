class_name EntitySelectedState
extends State


# Called when the node enters the scene tree for the first time.
func enter(_msg := {}):
#	owner.get_node("Sprite2D").opacity = 0.5
	owner.scale = Vector2(1.1, 1.1) 
	Globals.selected_entity = owner
	
func exit():
 
	Globals.selected_entity = null
	owner.scale = Vector2(1.0, 1.0) 
	
# there is a potential for a bug causeed by using the selected tile and not the tile the entity stands on
func update(delta):
	if (Input.is_action_just_pressed("left_mouse_click") ):
#		print_debug(Globals.selected_tile_coors, Globals.hovered_tile_coors) 
		$"../../MovementComponent".process_movement(owner.get_parent().get_parent().get_node("GridPositionTracker").gridPosition, Globals.hovered_tile_coors)
		state_machine.transition_to("Idle")
	elif   Globals.selected_entity != owner:
		state_machine.transition_to("Idle")
	elif Input.is_action_just_pressed("right_mouse_click") :
#		healthComponent.take_hit(1)
		$"../../Weapon".attack()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
#	if Input.is_action_just_pressed("left_mouse_click") and get_parent().get_parent().is_hovered:
#		Globals.selected_entity = null
#	state_machine.transition_to("Idle")
