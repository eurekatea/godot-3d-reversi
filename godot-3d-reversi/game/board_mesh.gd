extends MeshInstance

var fabric_board := preload("res://material/fabric_board.material")
var ceramics_board := preload("res://material/metal_board.material")

func _ready():
	assert(fabric_board and ceramics_board)

func set_texture(texture: String):
	if texture == "fabric":
		self.set_surface_material(0, fabric_board)
	else:
		self.set_surface_material(0, ceramics_board)
