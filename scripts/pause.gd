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
	loadStats()
	datos_usuario()


func _on_resume_pressed():
	$AnimationPlayer.play('menu_pausa_out')
	await $AnimationPlayer.animation_finished
	get_tree().paused=!get_tree().paused
	visible=false
func datos_usuario():
	$panelJugador/datosJugador/Vida.value=State.vida_actual
	$panelJugador/datosJugador/Mana.value=State.mana_actual
	$panelJugador/datosJugador/Experiencia.value=State.exp
	
	$panelJugador/datosJugador/Vida.max_value=State.vida_max
	$panelJugador/datosJugador/Mana.max_value=State.mana_max
	$panelJugador/datosJugador/Experiencia.max_value=100
	
	$panelJugador/datosJugador/Vida.get_node("Label").text= "PVs: %d/%d" % [State.vida_actual, State.vida_max]
	$panelJugador/datosJugador/Mana.get_node("Label").text= "PMs: %d/%d" % [State.mana_actual, State.mana_max]
	$panelJugador/datosJugador/Experiencia.get_node("Label").text= "EXP: %d/%d" % [State.exp, 100]
	
	$VBoxContainer/Estadisticas.text="ESTADISTICAS:  %d"%State.puntosNivel

func _on_quit_pressed():
	get_tree().quit()
func loadStats():
	$VBoxContainer/Destreza.text="Destreza:  "+str(State.des)
	$VBoxContainer/Fuerza.text="Fuerza:  "+str(State.fue)
	$VBoxContainer/Inteligencia.text="Inteligencia:  "+str(State.itg)
	$VBoxContainer/Poder.text="Poder:  "+str(State.pod)
	$VBoxContainer/Dinero.text="Dinero:  "+str(State.dinero)
	$VBoxContainer/Inventario.text ="Armadura:\n" + str(State.nombreArmadura(State.inventario["armadura"])) + "\n" + "Amuleto:\n" + str(State.nombreAmuleto(State.inventario["amuleto"])) + "\n" + "Arma 1:\n" + str(State.nombreArma(State.inventario["armas"][0])) + "\n" + "Arma 2:\n" + str(State.nombreArma(State.inventario["armas"][1]))

func _on_destreza_up_pressed():
	if State.puntosNivel>0:
		State.des+=1
		State.puntosNivel-=1


func _on_fuerza_up_pressed():
	if State.puntosNivel>0:
		State.fue+=1
		State.puntosNivel-=1

func _on_inteligencia_up_pressed():
	if State.puntosNivel>0:
		State.itg+=1
		State.puntosNivel-=1


func _on_poder_up_pressed():
	if State.puntosNivel>0:
		State.pod+=1
		State.puntosNivel-=1
