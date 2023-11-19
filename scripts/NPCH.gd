extends Node3D
@export var Dialogo: String
@export var DialogBBC: String
@export var Nombre: String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_area_entered(area):
	# Replace with function body.
	Dialog.LoadData(Dialogo,DialogBBC,Nombre)
	Dialog.StartDialog()
	get_tree().paused=!get_tree().paused
	State.vida_actual=State.vida_max

