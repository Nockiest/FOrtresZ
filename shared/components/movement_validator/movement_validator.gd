extends Node2D
# also check that the move lies within the grid
# Define the valid directions, movement patterns, and max movement range
@export var valid_directions = ['left', 'right', 'down', 'up', 'up-left', 'up-right', 'down-left', 'down-right']
@export var valid_movement_patterns: Array[Vector2i]  # Define the array with valid vectors
@export var valid_max_movement_range: float  # Define the maximum movement range

# Function to validate the move
func validate_move(from: Vector2i, to: Vector2i) -> bool:
	var movement_vector = to - from
	var movement_distance = movement_vector.length()

	# Check if movement is within the valid range
	if movement_distance > valid_max_movement_range:
#		print_debug(1)
		return false

	# Check if the movement matches any valid movement pattern
	for pattern in valid_movement_patterns:
#		print_debug(2)
		if movement_vector == pattern:
			return true

	# Translate the movement vector to a direction string
	var direction = ""
	if movement_vector.x < 0:
		direction += "left"
	elif movement_vector.x > 0:
		direction += "right"

	if movement_vector.y < 0:
		direction += "up"
	elif movement_vector.y > 0:
		direction += "down"

	# Check if the direction is valid
#	print_debug(direction in valid_directions)
	return direction in valid_directions
func _ready() -> void:
	validate_move(Vector2i(15,15), Vector2i(14,14))
	validate_move(Vector2i(15,15), Vector2i(15,14))
	validate_move(Vector2i(0,0), Vector2i(3,4))
	validate_move(Vector2i(15,15), Vector2i(26,96))
	validate_move(Vector2i(-2,-3), Vector2i(46,26))
