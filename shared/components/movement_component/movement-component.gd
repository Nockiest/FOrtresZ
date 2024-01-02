class_name momvement_component
extends Node2D


 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func process_movement(  to):
	if $MovementValidator.validate_move($GridPositionTracker.get_grid_position(), to):
		print("move would be valid")
