extends Node3D

@export var mapa = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Sprite3D2.visible:
		if Input.is_action_just_pressed("ui_accept"):
			AnimationLevel.change_scene_to_file("res://mapas/salafinal.tscn")
	



func _on_area_3d_area_entered(area):
	$Sprite3D2.visible=true


func _on_area_3d_area_exited(area):
	$Sprite3D2.visible=false
