extends TileMap


var fnl := FastNoiseLite.new()

func _ready() -> void:
	randomize()
	fnl.seed = randi()
	fnl.noise_type = FastNoiseLite.TYPE_CELLULAR
	fnl.fractal_octaves = 8
	fnl.domain_warp_fractal_lacunarity = 12.0
	generateMap()

func generateMap() -> void:
	for x in 900:
		for y in 500:
			var noiseVal :float= abs(fnl.get_noise_2d(x,y))
			if noiseVal < 0.55:
				set_cell(0, Vector2i(x,y), 0, Vector2(6,6))
			else:
				set_cell(0, Vector2i(x,y), 0, Vector2(12,11))
				
				
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
