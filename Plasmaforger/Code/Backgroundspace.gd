extends TextureRect
#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	texture.noise.seed = randi() % 500


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


