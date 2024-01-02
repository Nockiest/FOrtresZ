class_name HealthComponent
extends Node2D

@export var max_hp: int = 1
@export var start_hp: int = max_hp
@export var max_shields: int = 0
@export var start_shields: int = max_shields

signal health_ran_out()
signal shields_ran_out()

var current_hp: int = start_hp:
	set(new_hp):
		if new_hp <= 0:
			emit_signal("health_ran_out")
		current_hp = new_hp
		print("current health is", current_hp)
var current_shields: int = start_shields:
	set(new_shields):
		if new_shields <= 0:
			emit_signal("shields_ran_out")
		current_shields = new_shields
		print("current shields are", current_shields)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func take_hit(dmg: int) -> void:
	if current_shields > 0:
		# If there are shields, subtract damage from shields
		current_shields -= dmg
		# Check if shields ran out
	else:
		# If no shields, subtract damage from health
		current_hp -= dmg
		# Check if health ran out
 
func take_direct_health_damage(dmg):
	current_hp -= dmg
 
func regenerate(ammount):
	current_hp = min(ammount, max_hp)


# Add functions to retrieve current health and shields if needed
func get_current_health() -> int:
	return current_health

func get_current_shields() -> int:
	return current_shields
