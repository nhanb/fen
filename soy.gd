extends TextureRect

var following = false
var dragging_start_position = Vector2()

onready var fren = get_node("fren")
onready var anim = get_node("fren/SpecialAnim")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)


func _on_soy_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				following = true
				dragging_start_position = get_global_mouse_position()
				fren.play("drag")
			else:
				following = false
				fren.play("idle")
		elif event.button_index == BUTTON_RIGHT:
			#fren.play("AnimationPlayer")
			anim.play("Special")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)


func _on_fren_animation_finished():
	if(fren.animation == "special"):
		fren.play("idle")
		


func _on_SpecialAnim_animation_finished(anim_name):
	anim.stop()
	fren.play("idle")
