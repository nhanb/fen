extends Control

var dragging = false
var dragging_start_position = Vector2()
var previous_mouse_position = Vector2()

onready var fren = get_node("fren")
onready var anim = get_node("fren/SpecialAnim")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)


func _on_main_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				dragging = true
				dragging_start_position = get_global_mouse_position()
				fren.play("drag")
			else:
				dragging = false
				fren.play("idle")
		elif event.button_index == BUTTON_RIGHT:
			#fren.play("AnimationPlayer")
			anim.play("Special")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mouse_position = get_global_mouse_position()
	if dragging and mouse_position != previous_mouse_position:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)
	previous_mouse_position = mouse_position
	


func _on_fren_animation_finished():
	if(fren.animation == "special"):
		fren.play("idle")
		


func _on_SpecialAnim_animation_finished(anim_name):
	anim.stop()
	fren.play("idle")
