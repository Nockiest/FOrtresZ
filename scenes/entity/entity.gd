class_name Entity
extends Node2D

# Assuming Globals.tile_size is a Vector2 representing the desired size
var desired_size:Vector2 = Globals.tile_size

# Ensure the sprite has a texture and its size is not zero to avoid division by zero
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	var desired_size_i: Vector2i = Vector2i(Globals.tile_size.x, Globals.tile_size.y) # Assuming Globals.tile_size is Vector2i
#	var desired_size: Vector2 = desired_size_i # Convert Vector2i to Vector2 for calculations

	if $Sprite2D.texture and $Sprite2D.texture.get_size() != Vector2.ZERO:
		var texture_size: Vector2 = $Sprite2D.texture.get_size()
		var scale_factor: Vector2 = desired_size / texture_size
		$Sprite2D.scale = scale_factor
	else:
		print_debug("Sprite texture is not set or has zero size")

# Called every frame. 'delta' is the elapsed time since the previous frame.
 
