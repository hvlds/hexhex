extends Spatial
class_name Player

var player_name
var entities = {}
var color

func _init(_name, _color):
	player_name = _name
	color = _color

func add_entity(entity):
	entities[entity] = null
	entity.set_circle_color(color)

func remove_entity(entity):
	entities.erase(entity)

func get_active_entities():
	var active_entities = []
	for entity in entities:
		if entity.is_active:
			active_entities.push_back(entity)
			
	return active_entities