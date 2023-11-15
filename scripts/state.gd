extends Node


var objetos = preload("objetos.gd").new()
var clase = 1

var dinero = 0
var vida_actual = 50
var vida_max = 50

var mana_actual = 35
var mana_max = 35

var daño = 5

var des = 0
var fue = 0
var itg = 0
var pod = 0

var velocidad = 10
var defensa = 2
var resistencias = []
var pasivas = []
var prob_bloqueo = 0
var daños = {
	"Normal": 0,
	"Adicional": 0,
	"Hechizos": 0,
	"Critico": 0
}

var inventario = {
	#"armadura": 399, #399 --> "No tener armadura"
	#"amuleto": 299, #299 --> "No tener amuleto"
	#"armas": [199, 199] #199 --> "No tener armas"
	"armadura": 308, #Ejemplo: la armadura 304 debería aumentar la vida_act a 62, y añadir la resistencia [Fuego]
	"amuleto": 208, #Ejemplo: la armadura 203 debería aumentar la pod a 1 
	"armas": [112, 104]  # Dos ranuras para armas #Ejemplo: Daño 13 y Velocidad 20 
}

func _ready():
	print("/////////////////////////////////////////////////////////////////")
	print("Estadis iniciales: ")
	print("Vida maxima ", vida_max)
	print("Maná maxima ", mana_max)
	print("Destreza ", des)
	print("Fuerza ", fue)
	print("Inteligencia ", itg)
	print("Poder ", pod)
	print("Daño base ", daño)
	
	calcular_estadisticas()
	
	print("~~~~~")
	print("Y despues de mirar los objetos, las estadisticas son: ")
	print("Vida maxima ", vida_max)
	print("Maná maxima ", mana_max)
	print("Destreza ", des)
	print("Fuerza ", fue)
	print("Inteligencia ", itg)
	print("Poder ", pod)

	calcular_dano_especial()
	calcular_dano_normal()

func agregar_objeto_a_inventario(tipo_objeto, objeto_id):
	# Verifica si la ranura del inventario está disponible para el tipo de objeto
	if inventario.has(tipo_objeto) and inventario[tipo_objeto] == null:
		inventario[tipo_objeto] = objeto_id
		
	# Después de agregar el objeto al inventario, recalculate las estadísticas del personaje
	calcular_estadisticas()

func calcular_dano_normal():
	daño = 5 + fue*2
	daño = daño + daños.get("Normal", 0)
	print("El daño del ataque normal total será... ", daño)
func calcular_dano_especial():
	daño = 5 + fue*2
	daño = daño + daños.get("Normal", 0)
	daño = daño + daños.get("Adicional", 0)
	daño = daño + daños.get("Hechizos", 0)
	print("El daño del ataque especial total será... ", daño)

func calcular_estadisticas():
	#Reestablecemos las estadsticas a los valores base
	vida_max = 50
	mana_max = 35
	daño = 5
	des = 0
	fue = 0
	itg = 0
	pod = 0
	velocidad = 10
	defensa = 2
	resistencias = []
	pasivas = []
	prob_bloqueo = 0
	
	#Miramos los objetos del inventario para recalcular las estadisticas
	if inventario["armadura"]:
		var armadura_id = str(inventario["armadura"])
		print("La armadura equipada tiene id: ")
		print(armadura_id)
		
		if objetos.armaduras.has(armadura_id):
			var armadura_equipada = objetos.armaduras[armadura_id]
			#print("La armadura equipada se llama:")
			#print(armadura_equipada["Nombre"])
			# Incrementar la defensa basada en el efecto de la armadura si existe
			if "Efecto" in armadura_equipada:
				if "Resistencia" in armadura_equipada["Efecto"]:
					#print("La armadura tiene las siguiente resistencias: ")
					#print(armadura_equipada["Efecto"]["Resistencia"])
					resistencias.append(armadura_equipada["Efecto"]["Resistencia"])
				
				if "Invisivilidad" in armadura_equipada["Efecto"]:
					pasivas.append("Invisibilidad")
					
				defensa += armadura_equipada["Efecto"].get("Defensa", 0)
				vida_max += armadura_equipada["Efecto"].get("Vida", 0)
				vida_actual += armadura_equipada["Efecto"].get("Vida", 0)
				velocidad += armadura_equipada["Efecto"].get("Velocidad", 0)
				mana_max += armadura_equipada["Efecto"].get("Maná", 0)
				mana_actual += armadura_equipada["Efecto"].get("Maná", 0)
				itg += armadura_equipada["Efecto"].get("Inteligencia", 0)
				des += armadura_equipada["Efecto"].get("Destreza", 0)
				fue += armadura_equipada["Efecto"].get("Fuerza", 0)
				pod += armadura_equipada["Efecto"].get("Poder", 0)
				daños["Normal"] += armadura_equipada["Efecto"].get("Daño Normal", 0)
				daños["Adicional"] += armadura_equipada["Efecto"].get("Daño Adicional", 0)
				daños["Hechizos"] += armadura_equipada["Efecto"].get("Daño Hechizos", 0)
				daños["Critico"] += armadura_equipada["Efecto"].get("Daño Critico", 0)
				
				#FALTA ARMADURA 308, 310


	if inventario["amuleto"]:
		var amuleto_id = str(inventario["amuleto"])
		print("El amuleto equipado tiene id: ")
		print(amuleto_id)
		
		if objetos.amuletos.has(amuleto_id):
			var amuleto_equipado = objetos.amuletos[amuleto_id]
			
			if "Efecto" in amuleto_equipado:
				itg += amuleto_equipado["Efecto"].get("Inteligencia", 0)
				des += amuleto_equipado["Efecto"].get("Destreza", 0)
				fue += amuleto_equipado["Efecto"].get("Fuerza", 0)
				pod += amuleto_equipado["Efecto"].get("Poder", 0)
				vida_max += amuleto_equipado["Efecto"].get("Vida", 0)
				vida_actual += amuleto_equipado["Efecto"].get("Vida", 0)
				mana_max += amuleto_equipado["Efecto"].get("Maná", 0)
				mana_max += amuleto_equipado["Efecto"].get("Maná", 0)
				velocidad += amuleto_equipado["Efecto"].get("Velocidad", 0)
				daños["Normal"] += amuleto_equipado["Efecto"].get("Daño Normal", 0)
				daños["Adicional"] += amuleto_equipado["Efecto"].get("Daño Adicional", 0)
				daños["Hechizos"] += amuleto_equipado["Efecto"].get("Daño Hechizos", 0)
				daños["Critico"] += amuleto_equipado["Efecto"].get("Daño Critico", 0)
				
				#FALTA AMULETO 210, 211, 212
				
				
	for i in range(2):
		if inventario["armas"][i]:
			var arma_id = str(inventario["armas"][i])
			print("La arma ", i+1 ," equipada tiene id: ")
			print(arma_id)
			
			
			if objetos.armas.has(arma_id):
				var arma_equipada = objetos.armas[arma_id]
				
				if "Efecto" in arma_equipada:
					itg += arma_equipada["Efecto"].get("Inteligencia", 0)
					des += arma_equipada["Efecto"].get("Destreza", 0)
					fue += arma_equipada["Efecto"].get("Fuerza", 0)
					pod += arma_equipada["Efecto"].get("Poder", 0)
					daños["Normal"] += arma_equipada["Efecto"].get("Daño Normal", 0)
					daños["Adicional"] += arma_equipada["Efecto"].get("Daño Adicional", 0)
					daños["Hechizos"] += arma_equipada["Efecto"].get("Daño Hechizos", 0)
					daños["Critico"] += arma_equipada["Efecto"].get("Daño Critico", 0)
					velocidad += arma_equipada["Efecto"].get("Velocidad", 0)
					prob_bloqueo += arma_equipada["Efecto"].get("Prob Bloqueo", 0)
					
					#FAlTAN ARMAS (faltan bastantes "Efectos")
			
			
	print("LAS ESTADISTICAS SE ACTUALIZAN AHORA")
	print("Daño Normal: ", daños.get("Normal"))
	print("Daño Adicional: ", daños.get("Adicional"))
	print("Daño Hechizos: ", daños.get("Hechizos"))
	print("Daño Critico: ", daños.get("Critico"))
	
func obtener_des():
	return des
func obtener_itg():
	return itg
func obtener_fue():
	return fue
func obtener_pod():
	return pod
func obtener_vidaAct():
	return vida_actual
func obtener_vidaMax():
	return vida_max
func obtener_danoCrit():
	return daños.get("Critico")

func nombreArmadura(id):
	return objetos.armaduras[str(id)]["Nombre"]
	
