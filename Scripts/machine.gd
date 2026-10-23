extends Node
class_name Machine

@export var SerializableName : String
@export var Inputs : Array[Area3D]
@export var Output : Node3D
@export var Recipes : Array[Recipe]

var itemsInside : Array[Item]

func onInputEntered(body:Node3D):
	if body is ItemNode:
		itemsInside.append(body.ReferencedItem)
		body.queue_free()

func _ready() -> void:
	for input in Inputs:
		input.body_entered.connect(onInputEntered)

func spawnItem(item:Item):
	
	get_tree().current_scene.add_child()

func do_recipe():
	for recipe in Recipes:
		var has_all_items = true
		
		for ii in recipe.InputItems:
			if not itemsInside.has(ii):
				has_all_items = false
				break
		
		if has_all_items:
			

		
