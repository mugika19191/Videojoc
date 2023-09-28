extends Control

signal textbox_closed

@export var enemigo = Resource.new()

var vidaActualJugador = 0
var vidaActualEnemigo = 0
var bloqueando = false

# Called when the node enters the scene tree for the first time.
func _ready():
	setVida($contenedorVillano/ProgressBar, enemigo.vida, enemigo.vida)
	setVida($panelJugador/datosJugador/ProgressBar, State.vida_actual, State.vida_max)
	$contenedorVillano/villano.texture = enemigo.sprite
	
	vidaActualJugador = State.vida_actual
	vidaActualEnemigo = enemigo.vida
	
	$textBox.hide()
	$panelAcciones.hide()
	
	printearTexto("Comienza el combate!")
	await Signal(self, "textbox_closed")
	$panelAcciones.show()

func setVida(progress_bar, pv, maxPv):
	progress_bar.value = pv
	progress_bar.max_value = maxPv
	progress_bar.get_node("Label").text = "PVs: %d/%d" % [pv, maxPv]
	

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
	if bloqueando:
		printearTexto("Bloqueas %d" % State.defensa)
		await Signal(self,"textbox_closed")
		vidaActualJugador = max(0, vidaActualJugador - max(0,enemigo.daño-State.defensa))
		setVida($panelJugador/datosJugador/ProgressBar, vidaActualJugador, State.vida_max)
	else:
		vidaActualJugador = max(0, vidaActualJugador - enemigo.daño)
		setVida($panelJugador/datosJugador/ProgressBar, vidaActualJugador, State.vida_max)
	
	$AnimationPlayer.play("jugadorDañado")
	await Signal($AnimationPlayer, "animation_finished")

func _on_huir_pressed():
	printearTexto("Escapaste manin")
	await Signal(self,"textbox_closed")
	get_tree().quit() #Aquí en lugar de salir del juego, pues salir del combate de vuelta a la escena 3D


func _on_golpear_pressed():
	printearTexto("Golpeaste con %d de daño" % State.daño)
	await Signal(self,"textbox_closed")
	
	vidaActualEnemigo = max(0, vidaActualEnemigo - State.daño)
	setVida($contenedorVillano/ProgressBar, vidaActualEnemigo, enemigo.vida)
	
	$AnimationPlayer.play("enemigoDañado")
	await Signal($AnimationPlayer, "animation_finished")
	
	if vidaActualEnemigo == 0:
		printearTexto("Derrotaste al enemigo, ¡ENHORABUENA!")
		await Signal(self,"textbox_closed")
		get_tree().quit()
	
	turno_enemigo()


func _on_bloquear_pressed():
	bloqueando = true
	printearTexto("Te pones a la defensiva")
	await Signal(self,"textbox_closed")
	turno_enemigo()
