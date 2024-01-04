class_name EntitySelectedState
extends State


# Called when the node enters the scene tree for the first time.
func enter(_msg := {}):
#	owner.get_node("Sprite2D").opacity = 0.5
	owner.scale = owner.scale*1.1 
	Globals.selected_entity = owner
	
func exit():
 
	Globals.selected_entity = null
	owner.scale = owner.scale*0.9 
	
 
func update(delta):
	if (Input.is_action_just_pressed("left_mouse_click") ):
		var positionTracker = Utils.find_ancestor_by_factor(3, owner).get_node("GridPositionTracker")
		owner.movementComponent.process_movement(positionTracker.gridPosition, Globals.hovered_tile_coors)
		state_machine.transition_to("Idle")
	elif   Globals.selected_entity != owner:
		state_machine.transition_to("Idle")
	elif Input.is_action_just_pressed("right_mouse_click") :
#		healthComponent.take_hit(1)
		owner.weaponComponent.attack()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
#	if Input.is_action_just_pressed("left_mouse_click") and get_parent().get_parent().is_hovered:
#		Globals.selected_entity = null
#	state_machine.transition_to("Idle")
