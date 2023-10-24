extends Control
@export var Dialogo: String
@export var DialogoBBC: String
@export var Nombre: String
var arrayDialogo : Array
var arrayDialogoBBC : Array
var dialogoIndex : int
var fraseIndex: int
# Called when the node enters the scene tree for the first time.
func _ready():
	fraseIndex=0
	dialogoIndex=0
	splitDialogo()
	$back/Name.parse_bbcode(Nombre)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !(dialogoIndex < arrayDialogo.size()-1):
		$back/Icono.visible=false
	if Input.is_action_just_pressed("ui_accept"):
		if dialogoIndex < arrayDialogo.size()-1:
			dialogoIndex += 1
			fraseIndex=0
		else:
			visible=false
	avanzar()

func splitDialogo():
	arrayDialogo=Dialogo.split("&&")
	arrayDialogoBBC=DialogoBBC.split("&&")
	
func avanzar():
	if fraseIndex < arrayDialogo[dialogoIndex].length():
		var copia  = arrayDialogo[dialogoIndex].left(fraseIndex)
		$back/TextBox.parse_bbcode(copia)
		fraseIndex +=1
		if fraseIndex == arrayDialogo[dialogoIndex].length():
			$back/TextBox.parse_bbcode(arrayDialogoBBC[dialogoIndex])
