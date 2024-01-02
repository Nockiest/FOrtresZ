class_name EntitySelectedState
extends State


# Called when the node enters the scene tree for the first time.
func enter(_msg := {}):
	print("enterinig sselected state",  $"../../GridPositionTracker".get_grid_position())
#	owner.get_node("Sprite2D").opacity = 0.5
	owner.scale = Vector2(1.1, 1.1) 
	Globals.selected_entity = owner
	
func exit():
	print("exiting sselected state")
	Globals.selected_entity = null
	owner.scale = Vector2(1.0, 1.0) 
	
	
func update(delta):
	print( Globals.selected_entity , owner)
	if (Input.is_action_just_pressed("left_mouse_click")
			 or Globals.selected_entity != owner):
		state_machine.transition_to("Idle")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
#	if Input.is_action_just_pressed("left_mouse_click") and get_parent().get_parent().is_hovered:
#		Globals.selected_entity = null
#	state_machine.transition_to("Idle")
