extends TileMap



# Called when the node enters the scene tree for the first time.
func _ready():
	var tilemap = $TileMap
	var tile = tilemap.get_cellv(Vector2(0, 0))
	tilemap.set_cellv(Vector2(1, 0), tile)
	tilemap.set_cell(1, 0, tile)
	var tween = $Tween
	tween.interpolate_property(tilemap, "cell", tile, Vector2(1, 0), 1, Tween.TRANS_LINEAR)
	tween.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_ready()
	pass
