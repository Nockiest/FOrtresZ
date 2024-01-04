class_name MovementtValidator
extends Node

# Function to validate the move
func validate_move(from: Vector2i, to: Vector2i, validation_input_data: Dictionary, objectType:String="Entity") -> bool:
	# Extract data from the validation_input_data dictionary
	var valid_max_movement_range = validation_input_data["valid_max_movement_range"]
	var valid_movement_patterns = validation_input_data["valid_movement_patterns"]
	var valid_directions = validation_input_data["valid_directions"]
	var grid_size = Globals.grid_size

	var movement_vector = to - from
	var movement_distance = movement_vector.length()
	if not is_tile_empty(to , objectType) :
		printerr("isnt empty")
		return false
	# Check if movement is within the valid range
	if movement_distance > valid_max_movement_range:
		print_debug(1)
		return false

	# Check if the move lies within the grid
	if to.x < 0 or to.y < 0 or to.x >= grid_size.x or to.y >= grid_size.y:
		print_debug(2)
		return false

	# Check if the movement matches any valid movement pattern
	for pattern in valid_movement_patterns:
		if movement_vector == pattern:
			print_debug(3)
			return true

	# Translate the movement vector to a direction string
	var direction = GridUtils.get_movement_direction(to , from)
	print_debug(4)
	# Check if the direction is valid
	return direction in valid_directions

func is_tile_empty(destination: Vector2i, objectType:String) -> bool:
	# Find the tile node using the destination coordinates
	var tile_node = GridUtils.get_tile_from_coors(destination)
	
	# If the tile node is found, ask ObjectContainerManager if it's empty
	if tile_node:
		print("tile isnt empty", tile_node.get_node("ObjectContainerManager").is_container_full(objectType))
		return not tile_node.get_node("ObjectContainerManager").is_container_full(objectType)
	
	return false
# Function to get the movement direction string
# Function to get the movement direction string
 
