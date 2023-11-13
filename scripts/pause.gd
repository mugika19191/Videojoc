extends Control

@export var transitionSpeed = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused ==true:
			$AnimationPlayer.play('menu_pausa_out')
			await $AnimationPlayer.animation_finished
			get_tree().paused=!get_tree().paused
			visible=false
			return
		get_tree().paused = !get_tree().paused
		visible=true
		$AnimationPlayer.play("menu_pausa_in")
		await $AnimationPlayer.animation_finished
		


func _on_resume_pressed():
	get_tree().paused = !get_tree().paused
	visible=false


func _on_quit_pressed():
	get_tree().quit()
