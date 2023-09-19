extends Control


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused ==true:
			get_tree().paused=!get_tree().paused
			visible=false
			return
		get_tree().paused = !get_tree().paused
		visible=true


func _on_resume_pressed():
	get_tree().paused = !get_tree().paused
	visible=false


func _on_quit_pressed():
	get_tree().quit()
