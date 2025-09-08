class_name Action extends TextureRect


@onready var _action: Area2D = %Action
@onready var _action_shape: CollisionShape2D = %ActionShape
@onready var dragged: bool = true


var chained_pos: Vector2
var drag_st_pos: Vector2
var action_cell: ActionCell


func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		dragged = true
		drag_st_pos = global_position - get_global_mouse_position()
	elif event.is_action_released("click"):
		dragged = false
		if action_cell:
			top_level = true
			action_cell.add_action(self)
		else:
			global_position = chained_pos


func _ready() -> void:
	size_flags_vertical = 4
	size_flags_horizontal = 4
	await get_tree().physics_frame
	await get_tree().physics_frame 
	_action.global_position = global_position + size * 0.5
	_action_shape.shape.size = size
	_action.area_entered.connect(_on_area_entered)
	_action.area_exited.connect(_on_area_exited)
	chained_pos = global_position
	#print(global_position)


func _physics_process(delta: float) -> void:
	if dragged:
		global_position = get_global_mouse_position() + drag_st_pos


func _on_area_entered(cell_area: Area2D) -> void:
	action_cell = cell_area.get_parent()


func _on_area_exited(cell_area: Area2D) -> void:
	action_cell = null
