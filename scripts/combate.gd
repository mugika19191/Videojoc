extends Control

signal textbox_closed

@export var enemigo = Resource.new()

var vidaActualJugador = 0
var vidaActualEnemigo = 0
var manaActual = 0
var bloqueando = false
var spc = false
var coste = 20 - State.obtener_itg()*5
var critMult = 1
var critProb = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	randomEnem()
	setVida($contenedorVillano/ProgressBar, enemigo.vida, enemigo.vida)
	setVida($panelJugador/datosJugador/ProgressBar, State.vida_actual, State.vida_max)
	setMana($panelJugador/datosJugador/ProgressBar2, State.mana_actual, State.mana_max)
	$contenedorVillano/villano.texture = enemigo.sprite
	#print("EL COMBATE SE EJECUTA AHORA")
	coste = 20 - State.obtener_itg()*5
	$panelAcciones/acciones/especial.text = "ESPECIAL (%d MPs)" % coste
	
	
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
	if vidaActualJugador <=0:
		printearTexto("Oh, el dulce sabor de la muerte...")
		await Signal(self,"textbox_closed")
		printearTexto("Antaño hace que no te sentías tan en paz con el mundo, y ahora desde tus ojos del alma observas como tu cuerpo se marchita
		bajo tus pies. La delicadeza de la mortalidad ya no te persigue en esta nueva forma, pues deambulas en el mundo como un mota de polvo que 
		fue una vez parte de una estrella lejana. Descansa ahora, criatura, pues mañana despertarás de nuevo en esta mazmorra,
		y tu sufrimiendo volverá a dar comienzo.")
		await Signal(self,"textbox_closed")
		printearTexto("HAS MUERTO")
		await Signal(self,"textbox_closed")
		get_tree().quit()
	

func _on_huir_pressed():
	var rng = RandomNumberGenerator.new()
	var huir = 20 + State.des*20
	if rng.randi_range(1,100) <= huir:
		printearTexto("Escapaste manin")
		await Signal(self,"textbox_closed")
		self.visible=false	
		$Camera2D.enabled=false
		get_tree().paused=!get_tree().paused #Aquí en lugar de salir del juego, pues salir del combate de vuelta a la escena 3D
	else:
		printearTexto("En el fulgor del encuentro no encuentras la oportunidad de huir")
		await Signal(self,"textbox_closed")
		turno_enemigo()
		
	


func _on_golpear_pressed():
	var rng = RandomNumberGenerator.new()
	var dmg = State.daño
	
	if rng.randi_range(1,100) <= critProb:
		critMult = 2
	else:
		critMult = 1
	
	if spc: #Si ataque especial
		if State.clase == 1:#Especial del guerrero +daño +defensa
			#dmg = (State.daño+5)*critMult
			State.calcular_dano_especial()
			dmg = (State.daño)*critMult
			if critMult == 2:
				dmg = dmg + State.obtener_danoCrit()
				printearTexto("Ha sido un golpe crítico ¡Doble de daño!")
				await Signal(self,"textbox_closed")
			printearTexto("Arremetes contra el enemigo con tu furia, provocando %d de daño" % dmg)
			await Signal(self,"textbox_closed")
	
			vidaActualEnemigo = max(0, vidaActualEnemigo - dmg)
			setVida($contenedorVillano/ProgressBar, vidaActualEnemigo, enemigo.vida)
		else:
			printearTexto("Hm...Parece que esta clase no dispone de habilidad especial")
	else: #Si ataque normal
		State.calcular_dano_normal()
		dmg = (State.daño)*critMult
		if critMult == 2:
			dmg = dmg + State.obtener_danoCrit()
			printearTexto("Ha sido un golpe crítico ¡Doble de daño!")
			await Signal(self,"textbox_closed")
		printearTexto("Golpeaste con %d de daño" % dmg)
		await Signal(self,"textbox_closed")
	
		vidaActualEnemigo = max(0, vidaActualEnemigo - dmg)
		setVida($contenedorVillano/ProgressBar, vidaActualEnemigo, enemigo.vida)
	
	$AnimationPlayer.play("enemigoDañado")
	await Signal($AnimationPlayer, "animation_finished")
	
	if vidaActualEnemigo == 0:
		State.vida_actual = vidaActualJugador
		State.mana_actual = manaActual
		State.dinero = State.dinero + enemigo.dinero
		print(State.dinero)
		printearTexto("Derrotaste al enemigo, ¡ENHORABUENA!")
		await Signal(self,"textbox_closed")
		self.visible=false
		get_tree().paused=!get_tree().paused
		$Camera2D.enabled=false
		$AudioStreamPlayer2D.stop()
	turno_enemigo()


#func _on_bloquear_pressed():
#	bloqueando = true
#	printearTexto("Te pones a la defensiva??")
#	await Signal(self,"textbox_closed")
#	turno_enemigo()


func _on_especial_pressed():
	if State.clase == 1:#Guerrero
		coste = 20 - State.obtener_itg()*5
		if manaActual>=coste:
			manaActual = manaActual - coste
			setMana($panelJugador/datosJugador/ProgressBar2, manaActual, State.mana_max)
			printearTexto("Utilizas tu movimiento especial de guerrero")
			await Signal(self,"textbox_closed")
			printearTexto("¡Alzas tu escudo con vigor, aprietas la mandíbula y cargas hacia delante!")
			spc = true
			$panelAcciones/acciones/especial.visible = false
		else:
			printearTexto("No tienes los MP suficientes para hacer eso")
	await Signal(self,"textbox_closed")
	
func randomEnem():
	var rng = RandomNumberGenerator.new()
	var com=0
	com=rng.randi_range(0,3)
	enemigo=load("res://enemigos/"+str(com)+".tres")
	
