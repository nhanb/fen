extends TextureRect

var following = false
var dragging_start_position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)


func _on_soy_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			following = true
			dragging_start_position = get_global_mouse_position()
		else:
			following = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)
