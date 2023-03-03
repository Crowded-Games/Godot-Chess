extends FlowContainer

@export var chess_board_rows = 8
@export var chess_board_columns = 8

@export var tile: PackedScene

var grow_size = 54
# False is white, true is white
var current_color = false

signal board_ready

# Called when the node enters the scene tree for the first time.
func _ready():
	# set boundaries
	var column_number = 1
	var row_number = 0
	while column_number != chess_board_columns:
		self.size.x += grow_size
		column_number += 1
	while row_number != chess_board_rows:
		self.size.y += grow_size
		row_number += 1
	
	# Add tiles
	column_number = 0
	while column_number != chess_board_columns:
		row_number = 0
		while row_number != chess_board_rows:
			var thing = tile.instantiate()
			# set the color, then reverse it for the next go.
			thing.tile_color = current_color
			current_color = !current_color
			thing.tile_color = current_color
			thing._ready()
			# set the name so I can do fun stuff.
			thing.name = str(column_number) + " " + str(row_number)
			add_child(thing)
			row_number += 1
		if chess_board_columns % 2 == 0:
			current_color = !current_color
		column_number += 1
	board_ready.emit()
