extends Control

signal textbox_closed

@export var enemigo = Resource.new()

var vidaActualJugador = 0
var vidaActualEnemigo = 0
var manaActual = 0
var bloqueando = false
var spc = false

# Called when the node enters the scene tree for the first time.
func _ready():
	setVida($contenedorVillano/ProgressBar, enemigo.vida, enemigo.vida)
	setVida($panelJugador/datosJugador/ProgressBar, State.vida_actual, State.vida_max)
	setMana($panelJugador/datosJugador/ProgressBar2, State.mana_actual, State.mana_max)
	$contenedorVillano/villano.texture = enemigo.sprite
	
	vidaActualJugador = State.vida_actual
	vidaActualEnemigo = enemigo.vida
	manaActual = State.mana_actual
	
	$textBox.hide()
	$panelAcciones.hide()
	
	printearTexto("Comienza el combate!")
	await Signal(self, "textbox_closed")
	$panelAcciones.show()

func setVida(progress_bar, pv, maxPv):
	progress_bar.value = pv
	progress_bar.max_value = maxPv
	progress_bar.get_node("Label").text = "PVs: %d/%d" % [pv, maxPv]

func setMana(progress_bar, mn, maxMn):
	progress_bar.value = mn
	progress_bar.max_value = maxMn
	progress_bar.get_node("Label").text = "MPs: %d/%d" % [mn, maxMn]	

func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $textBox.visible:
		$textBox.hide()
		emit_signal("textbox_closed")

func printearTexto(texto):
	$textBox.show()
	$textBox/Label.text = texto

func turno_enemigo():
	printearTexto("Te golpean con %d de daño" % enemigo.daño)
	await Signal(self,"textbox_closed")
	if spc and State.clase == 1:
		printearTexto("Pero bloqueas %d con tu confiable escudo" % State.defensa)
		await Signal(self,"textbox_closed")
		vidaActualJugador = max(0, vidaActualJugador - max(0,enemigo.daño-State.defensa))
		setVida($panelJugador/datosJugador/ProgressBar, vidaActualJugador, State.vida_max)
	else:
		vidaActualJugador = max(0, vidaActualJugador - enemigo.daño)
		setVida($panelJugador/datosJugador/ProgressBar, vidaActualJugador, State.vida_max)
	
	$AnimationPlayer.play("jugadorDañado")
	await Signal($AnimationPlayer, "animation_finished")
	if spc == true:#si hemos usado el especial, lo desactivamos al final del turno
		$panelAcciones/acciones/especial.visible = true
		spc = false
	

func _on_huir_pressed():
	printearTexto("Escapaste manin")
	await Signal(self,"textbox_closed")
	self.visible=false
	$Camera2D.enabled=false
	get_tree().paused=!get_tree().paused #Aquí en lugar de salir del juego, pues salir del combate de vuelta a la escena 3D


func _on_golpear_pressed():
	if spc:
		if State.clase == 1:#Especial del guerrero +daño +defensa
			var dmg = State.daño+5
			printearTexto("Arremetes contra el enemigo con tu furia, provocando %d de daño" % dmg)
			await Signal(self,"textbox_closed")
	
			vidaActualEnemigo = max(0, vidaActualEnemigo - dmg)
			setVida($contenedorVillano/ProgressBar, vidaActualEnemigo, enemigo.vida)
		else:
			printearTexto("Hm...Parece que esta clase no dispone de habilidad especial")
	else:
		printearTexto("Golpeaste con %d de daño" % State.daño)
		await Signal(self,"textbox_closed")
	
		vidaActualEnemigo = max(0, vidaActualEnemigo - State.daño)
		setVida($contenedorVillano/ProgressBar, vidaActualEnemigo, enemigo.vida)
	
	$AnimationPlayer.play("enemigoDañado")
	await Signal($AnimationPlayer, "animation_finished")
	
	if vidaActualEnemigo == 0:
		printearTexto("Derrotaste al enemigo, ¡ENHORABUENA!")
		await Signal(self,"textbox_closed")
		self.visible=false
		get_tree().paused=!get_tree().paused
		$Camera2D.enabled=false
	turno_enemigo()


#func _on_bloquear_pressed():
#	bloqueando = true
#	printearTexto("Te pones a la defensiva??")
#	await Signal(self,"textbox_closed")
#	turno_enemigo()


func _on_especial_pressed():
	if State.clase == 1:#Guerrero
		if manaActual>=15:
			manaActual = manaActual - 15
			setMana($panelJugador/datosJugador/ProgressBar2, manaActual, State.mana_max)
			printearTexto("Utilizas tu movimiento especial de guerrero")
			await Signal(self,"textbox_closed")
			printearTexto("¡Alzas tu escudo con vigor, aprietas la mandíbula y cargas hacia delante!")
			spc = true
			$panelAcciones/acciones/especial.visible = false
		else:
			printearTexto("No tienes los MP suficientes para hacer eso")
	await Signal(self,"textbox_closed")
	
