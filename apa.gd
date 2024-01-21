extends TileMap

var DIRECTIONS = [Vector2(0, -1), Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0)]
var source_tile_ids = []
var target_tile_id

func _ready():
	set_process_input(true)
	target_tile_id = 3  
	source_tile_ids.append(0)  
	source_tile_ids.append(1)
	source_tile_ids.append(2)
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var mouse_position = get_local_mouse_position()
		var clicked_tile = world_to_map(mouse_position)
		fillTiles(clicked_tile)
		update()


func fillTiles(start_position: Vector2) -> void:
	var open_list = [start_position]
	var grid_size = cell_size

	while open_list.size() > 0:
		var current_position = open_list.pop_back()

		if source_tile_ids.find(get_cellv(current_position)) != -1:
			set_cellv(current_position, target_tile_id)

			for dir in DIRECTIONS:
				var neighbor = current_position + dir
				if is_valid_tile(neighbor, grid_size) and source_tile_ids.find(get_cellv(neighbor)) != -1 and !open_list.has(neighbor):
					open_list.append(neighbor)

func is_valid_tile(position: Vector2, grid_size: Vector2) -> bool:
	return position.x >= 0 && position.y >= 0 && position.x < grid_size.x && position.y < grid_size.y
