extends WorldEnvironment

@export var combate : PackedScene
var rng = RandomNumberGenerator.new()
var com=0
var rem=false
# Called when the node enters the scene tree for the first time.
func _ready():
	# Replace with function body.
	pass
	
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"../Player".velocity.x !=0 || $"../Player".velocity.z !=0:
		rng.randomize()
		com=rng.randi_range(0,1000)
		if (com<2):
			get_tree().paused=!get_tree().paused
			var comateI := combate.instantiate()
			add_child(comateI)	


func _on_child_entered_tree(node):
	if get_child_count()>1:
		remove_child(get_child(get_child_count()-2))
