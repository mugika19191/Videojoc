extends Node3D

@export var Dialogo: String
@export var DialogBBC: String
@export var Nombre: String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Sprite3D2.visible && Input.is_action_just_pressed("ui_accept") && !get_tree().paused:
		Dialog.LoadData(Dialogo,DialogBBC,Nombre)
		Dialog.StartDialog()
		get_tree().paused=!get_tree().paused

func _on_area_3d_area_entered(area):
	# Replace with function body.
	$Sprite3D2.visible=true

func _on_area_3d_area_exited(area):
	$Sprite3D2.visible=false
