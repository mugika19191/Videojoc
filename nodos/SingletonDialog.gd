extends Control

var Dialogo: String
var DialogoBBC: String
var Nombre: String
var arrayDialogo : Array
var arrayDialogoBBC : Array
var dialogoIndex : int
var fraseIndex: int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		$AnimationPlayer.play("cursor")
		visible=true
		if !(dialogoIndex < arrayDialogo.size()-1):
			$Dialog/back/Icono.visible=false
		if Input.is_action_just_pressed("ui_cont"):
			if dialogoIndex < arrayDialogo.size()-1:
				dialogoIndex += 1
				fraseIndex=0
			else:
				visible=false
				$Dialog/back/Icono.visible=true
				fraseIndex=0
				dialogoIndex=0
				splitDialogo()
				$Dialog/back/Name.parse_bbcode(Nombre)
				get_tree().paused=!get_tree().paused
		avanzar()

func splitDialogo():
	arrayDialogo=Dialogo.split("&&")
	arrayDialogoBBC=DialogoBBC.split("&&")
	
func avanzar():
	if fraseIndex < arrayDialogo[dialogoIndex].length():
		var copia  = arrayDialogo[dialogoIndex].left(fraseIndex)
		$Dialog/back/TextBox.parse_bbcode(copia)
		fraseIndex +=1
		if fraseIndex == arrayDialogo[dialogoIndex].length():
			$Dialog/back/TextBox.parse_bbcode(arrayDialogoBBC[dialogoIndex])
			
func LoadData(firstP:String,secondP:String,nameP:String):
	fraseIndex=0
	dialogoIndex=0
	Dialogo=firstP
	DialogoBBC=secondP
	Nombre=nameP
	$Dialog/back/Name.parse_bbcode(Nombre)
	splitDialogo()

func StartDialog():
	visible=true
