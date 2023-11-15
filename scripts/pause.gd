extends Control

@export var transitionSpeed = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel")&&!get_tree().paused:
		if get_tree().paused ==true:
			$AnimationPlayer.play('menu_pausa_out')
			await $AnimationPlayer.animation_finished
			get_tree().paused=!get_tree().paused
			visible=false
			return
		loadStats()
		get_tree().paused = !get_tree().paused
		visible=true
		$AnimationPlayer.play("menu_pausa_in")
		await $AnimationPlayer.animation_finished
		


func _on_resume_pressed():
	$AnimationPlayer.play('menu_pausa_out')
	await $AnimationPlayer.animation_finished
	get_tree().paused=!get_tree().paused
	visible=false


func _on_quit_pressed():
	get_tree().quit()
func loadStats():
	$VBoxContainer/Destreza.text="Destreza:  "+str(State.des)
	$VBoxContainer/Fuerza.text="Fuerza:  "+str(State.fue)
	$VBoxContainer/Inteligencia.text="Inteligencia:  "+str(State.itg)
	$VBoxContainer/Poder.text="Poder:  "+str(State.pod)
	$VBoxContainer/Dinero.text="Dinero:  "+str(State.dinero)
	$VBoxContainer/Inventario.text ="Armadura:" + str(State.nombreArmadura(State.inventario["armadura"]))
