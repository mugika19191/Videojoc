extends Node


var objetos = preload("objetos.gd").new()
var vida_actual = 50
var vida_max = 50
var mana_actual = 30
var mana_max = 30
var daño = 10
var des = 0
var fue = 0
var itg = 0
var pod = 0
var velocidad = 10
var defensa = 2
var resistencias = []
var pasivas = []
var prob_bloqueo = 0

var inventario = {
	"armadura": 304, #Ejemplo: la armadura 304 debería aumentar la vida_act a 62, y añadir la resistencia [Fuego]
	"amuleto": 203, #Ejemplo: la armadura 203 debería aumentar el poder a 1 
	"armas": [101, 102]  # Dos ranuras para armas #Ejemplo: Daño 13 y Velocidad 20 
}

func _ready():
	print("La vida maxima al principio es: ")
	print(vida_max)
	calcular_estadisticas()
	print("Y despues de mirar los objetos la vida maxima es: ")
	print(vida_max)
	print(resistencias)
	print("El poder al final es: ")
	print(pod)
	print("El daño final es: ")
	print(daño)
	print("La velocidad final es: ")
	print(velocidad)

func agregar_objeto_a_inventario(tipo_objeto, objeto_id):
	# Verifica si la ranura del inventario está disponible para el tipo de objeto
	if inventario.has(tipo_objeto) and inventario[tipo_objeto] == null:
		inventario[tipo_objeto] = objeto_id
		
	# Después de agregar el objeto al inventario, recalculate las estadísticas del personaje
	calcular_estadisticas()


func calcular_estadisticas():
	#Reestablecemos las estadsticas a los valores base
	vida_max = 50
	mana_max = 30
	daño = 10
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
			print("La armadura equipada se llama:")
			print(armadura_equipada["Nombre"])
			# Incrementar la defensa basada en el efecto de la armadura si existe
			if "Efecto" in armadura_equipada:
				if "Resistencia" in armadura_equipada["Efecto"]:
					print("La armadura tiene las siguiente resistencias: ")
					print(armadura_equipada["Efecto"]["Resistencia"])
					resistencias.append(armadura_equipada["Efecto"]["Resistencia"])
				
				if "Invisivilidad" in armadura_equipada["Efecto"]:
					pasivas.append("Invisibilidad")
					
				defensa += armadura_equipada["Efecto"].get("Defensa", 0)
				vida_max += armadura_equipada["Efecto"].get("Vida", 0)
				vida_actual += armadura_equipada["Efecto"].get("Vida", 0)
				velocidad += armadura_equipada["Efecto"].get("Velocidad", 0)
				mana_max += armadura_equipada["Efecto"].get("Maná", 0)
				mana_max += armadura_equipada["Efecto"].get("Maná", 0)
				itg += armadura_equipada["Efecto"].get("Inteligencia", 0)
				des += armadura_equipada["Efecto"].get("Destreza", 0)
				fue += armadura_equipada["Efecto"].get("Fuerza", 0)
				pod += armadura_equipada["Efecto"].get("Poder", 0)
				
				#FALTA ARMADURA 308, 309, 310


	if inventario["amuleto"]:
		var amuleto_id = str(inventario["amuleto"])
		
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
				
				#FALTA AMULETO 205, 206, 207, 208, 210, 212
				
				
	for i in range(2):
		if inventario["armas"][i]:
			var arma_id = str(inventario["armas"][i])
			
			if objetos.armas.has(arma_id):
				var arma_equipada = objetos.armas[arma_id]
				
				if "Efecto" in arma_equipada:
					itg += arma_equipada["Efecto"].get("Inteligencia", 0)
					des += arma_equipada["Efecto"].get("Destreza", 0)
					fue += arma_equipada["Efecto"].get("Fuerza", 0)
					pod += arma_equipada["Efecto"].get("Poder", 0)
					daño += arma_equipada["Efecto"].get("Daño Adicional", 0)
					velocidad += arma_equipada["Efecto"].get("Velocidad", 0)
					prob_bloqueo += arma_equipada["Efecto"].get("Prob Bloqueo", 0)
					
					#FAlTAN ARMAS (faltan bastantes "Efectos")
			
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
