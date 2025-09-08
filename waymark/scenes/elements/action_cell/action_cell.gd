class_name ActionCell extends Control


@onready var _cell_area: Area2D = %CellArea
@onready var _cell_area_shape: CollisionShape2D = %CellAreaShape
@onready var _cell: TextureRect = %Cell


func _gui_input(event: InputEvent) -> void:
	print("00")


func _ready() -> void:
	_cell_area.area_entered.connect(_on_cell_area_entered)
	
	size_flags_vertical = 4
	size_flags_horizontal = 4
	await get_tree().physics_frame
	await get_tree().physics_frame 
	_cell_area.global_position = global_position + size * 0.5
	_cell_area_shape.shape.size = size


func _on_cell_area_entered(action_area: Area2D) -> void:
	action_area


func add_action(new_action: Action):
	new_action.chained_pos = _cell.size / 2.0 + _cell.global_position - new_action.size / 2.0
	new_action.call_deferred("reparent", _cell)
	new_action.set_deferred("global_position", new_action.chained_pos)
