class_name ObjectContainerManager extends Node2D

 
@export var entity_container: ObjectContainer 
@export var structure_container :  ObjectContainer 
@export var projectile_container :  ObjectContainer 

# Called when the node enters the scene tree for the first time.
 

# Function to receive a node and send it to the appropriate container
func add_child_node(node: Node) -> void:
	
	if node :
		entity_container.recieve_child_node(node)
#    elif node is Structure:
#        structure_container.recieve_child_node(node)
	elif node is Projectile:
		projectile_container.recieve_child_node(node)
	else:
		print_debug("Unknown node type")

# Function to retrieve an object from the appropriate container
func retrieve_object(type: String, name: String) -> Node:
	var container: ObjectContainer

	# Select the appropriate container based on the type
	match type:
		"Entity":
			container = entity_container
		"Structure":
			printerr("currently not supporting structures")
			container = structure_container
		"Projectile":
			container = projectile_container
		_:
			print_debug("Unknown object type")
			return null

	# Retrieve the object from the container based on the name
	return container.retrieve_child_node_by_name(name)
