extends Control

@export var transitionSpeed = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused ==true:
			get_tree().paused=!get_tree().paused
			visible=false
			return
		get_tree().paused = !get_tree().paused
		visible=true
	if visible:
		if $TextureRect.modulate.a8<255:
			$TextureRect.modulate.a8 = $TextureRect.modulate.a8+transitionSpeed
	else:
		$TextureRect.modulate.a8=0


func _on_resume_pressed():
	get_tree().paused = !get_tree().paused
	visible=false


func _on_quit_pressed():
	get_tree().quit()
