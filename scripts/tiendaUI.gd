extends Control

var objetos = [199,199,199,199]

# Called when the node enters the scene tree for the first time.
func _ready(): #12 armas; 13 amuletos; 10 armaduras
	var rng = RandomNumberGenerator.new()
	var item = 0
	var id = 0
	while item<4:
		id = rng.randi_range(1,3)*100
		if id == 100:
			id = id + rng.randi_range(1,12)
		elif id == 200:
			id = id + rng.randi_range(1,13)
		elif id == 300:
			id = id + rng.randi_range(1,10)
		else:
			id = 199
		if item == 0:
			if id < 200:
				$panelAcciones/objetosArriba/objeto1.text = State.nombreArma(id)
			elif id < 300:
				$panelAcciones/objetosArriba/objeto1.text = State.nombreAmuleto(id)
			else:
				$panelAcciones/objetosArriba/objeto1.text = State.nombreArmadura(id)
		elif item == 1:
			if id < 200:
				$panelAcciones/objetosArriba/objeto2.text = State.nombreArma(id)
			elif id < 300:
				$panelAcciones/objetosArriba/objeto2.text = State.nombreAmuleto(id)
			else:
				$panelAcciones/objetosArriba/objeto2.text = State.nombreArmadura(id)
		if item == 2:
			if id < 200:
				$panelAcciones/objetosAbajo/objeto3.text = State.nombreArma(id)
			elif id < 300:
				$panelAcciones/objetosAbajo/objeto3.text = State.nombreAmuleto(id)
			else:
				$panelAcciones/objetosAbajo/objeto3.text = State.nombreArmadura(id)
		if item == 3:
			if id < 200:
				$panelAcciones/objetosAbajo/objeto4.text = State.nombreArma(id)
			elif id < 300:
				$panelAcciones/objetosAbajo/objeto4.text = State.nombreAmuleto(id)
			else:
				$panelAcciones/objetosAbajo/objeto4.text = State.nombreArmadura(id)

		objetos[item] = id
		item = item + 1
			
			
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_objeto_1_pressed():
	if objetos[0] < 200:
		if State.inventario["armas"][0] == 199:
			State.inventario["armas"][0] = objetos[0]
		else:
			State.inventario["armas"][1] = objetos[0]
	elif objetos[0] < 300:
		State.inventario["amuleto"] = objetos[0]
	else:
		State.inventario["armadura"] = objetos[0]
	$panelAcciones/objetosArriba/objeto1.visible = false


func _on_objeto_2_pressed():
	if objetos[1] < 200:
		if State.inventario["armas"][0] == 199:
			State.inventario["armas"][0] = objetos[1]
		else:
			State.inventario["armas"][1] = objetos[1]
	elif objetos[1] < 300:
		State.inventario["amuleto"] = objetos[1]
	else:
		State.inventario["armadura"] = objetos[1]
	$panelAcciones/objetosArriba/objeto2.visible = false


func _on_objeto_3_pressed():
	if objetos[2] < 200:
		if State.inventario["armas"][0] == 199:
			State.inventario["armas"][0] = objetos[2]
		else:
			State.inventario["armas"][1] = objetos[2]
	elif objetos[2] < 300:
		State.inventario["amuleto"] = objetos[2]
	else:
		State.inventario["armadura"] = objetos[2]
	$panelAcciones/objetosAbajo/objeto3.visible = false


func _on_objeto_4_pressed():
	if objetos[3] < 200:
		if State.inventario["armas"][0] == 199:
			State.inventario["armas"][0] = objetos[3]
		else:
			State.inventario["armas"][1] = objetos[3]
	elif objetos[3] < 300:
		State.inventario["amuleto"] = objetos[3]
	else:
		State.inventario["armadura"] = objetos[3]
	$panelAcciones/objetosAbajo/objeto4.visible = false


func _on_button_pressed():#salir
	State.calcular_estadisticas()
	AnimationLevel.change_scene_to_file("res://mapas/Prototipo.tscn")
	get_tree().paused=!get_tree().paused
