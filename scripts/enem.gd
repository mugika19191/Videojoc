extends Node3D


@export var combate : PackedScene
# Configura las propiedades de la animación circular
var radius =3  # Radio del círculo
var speed = 1   # Velocidad de la rotación

# Variables de estado de la animación
var angle = 0  # Ángulo actual

func _process(delta: float) -> void:
	# Incrementa el ángulo en función de la velocidad
	angle += speed * delta

	# Calcula la nueva posición en el círculo
	var x = radius * cos(angle)
	var z = radius * sin(angle)

	# Mueve el objeto a la nueva posición
	transform.origin.x = x
	transform.origin.z = z
	
		
			
	
func _on_area_3d_area_entered(area):
	get_tree().paused=!get_tree().paused
	var comateI := combate.instantiate()
	add_child(comateI)
	print(get_child_count())
	
	


func _on_area_3d_2_area_exited(area):
	var i = 0
	while i<get_child_count():
		print(get_child(i).name)
		i+=1
	remove_child(get_child(get_child_count()-1))
