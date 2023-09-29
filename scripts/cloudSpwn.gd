extends CSGBox3D

@export var clouds : int =3
@export var _cloud : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnClouds()


# Called every frame. 'delta' is the elapsed time since the previous frame.
var rng = RandomNumberGenerator.new()

func _process(delta):
	pass
	
	
func spawnClouds():
	while clouds >=0:
		clouds -=1
		
		var x :float = rng.randf_range(size.x / 2 , -size.x/2)
		var y :float = rng.randf_range(size.y / 2 , -size.y/2)
		var z :float = rng.randf_range(size.z / 2 , -size.z/2)
		
		var spawn_pos : Vector3 = Vector3(x,y,z)
		
		var cloud := _cloud.instantiate()
		add_child(cloud)
		cloud.global_position = self.global_position + spawn_pos
