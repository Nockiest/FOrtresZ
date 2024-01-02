class_name MovementtValidator
extends Node

# Function to validate the move
func validate_move(from: Vector2i, to: Vector2i, validation_input_data: Dictionary) -> bool:
	# Extract data from the validation_input_data dictionary
	var valid_max_movement_range = validation_input_data["valid_max_movement_range"]
	var valid_movement_patterns = validation_input_data["valid_movement_patterns"]
	var valid_directions = validation_input_data["valid_directions"]
	var grid_size = Globals.grid_size

	var movement_vector = to - from
	var movement_distance = movement_vector.length()

	# Check if movement is within the valid range
	if movement_distance > valid_max_movement_range:
		return false

	# Check if the move lies within the grid
	if to.x < 0 or to.y < 0 or to.x >= grid_size.x or to.y >= grid_size.y:
		return false

	# Check if the movement matches any valid movement pattern
	for pattern in valid_movement_patterns:
		if movement_vector == pattern:
			return true

	# Translate the movement vector to a direction string
	var direction = get_movement_direction(movement_vector)

	# Check if the direction is valid
	return direction in valid_directions

# Function to get the movement direction string
func get_movement_direction(movement_vector: Vector2i) -> String:
	var direction = ""
	if movement_vector.x < 0:
		direction += "left"
	elif movement_vector.x > 0:
		direction += "right"

	if movement_vector.y < 0:
		direction += "up"
	elif movement_vector.y > 0:
		direction += "down"

	return direction
