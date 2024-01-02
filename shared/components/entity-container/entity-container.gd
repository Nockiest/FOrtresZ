class_name EntityContainer
extends Node2D
signal entities_changed(entities) 

@export var max_entities: int = 1

# Function to add a child node
func add_child_node(child_node):
	if get_child_count() < max_entities:
		add_child(child_node)
		emit_signal("entities_changed", get_children())
	else:
		print_debug("Maximum number of children reached: ", max_entities)

# Function to remove a child node
func remove_child_node(child_node):
	if has_node(child_node.get_name()):
		remove_child(child_node)
		emit_signal("entities_changed", get_children())
	else:
		print_debug("Child node not found")
