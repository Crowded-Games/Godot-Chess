extends Control

@export_group("Black Pieces")
@export var black_king: CompressedTexture2D
@export var black_queen: CompressedTexture2D
@export var black_rook: CompressedTexture2D
@export var black_knight: CompressedTexture2D
@export var black_bishop: CompressedTexture2D
@export var black_pawn: CompressedTexture2D

@export_group("White Pieces")
@export var white_king: CompressedTexture2D
@export var white_queen: CompressedTexture2D
@export var white_rook: CompressedTexture2D
@export var white_knight: CompressedTexture2D
@export var white_bishop: CompressedTexture2D
@export var white_pawn: CompressedTexture2D

var selected: String = ""
var piece: CompressedTexture2D = null

var white_turn = true

func spawn():
	var chess_board = get_node("chess_board")
	# Now, using this chess board, we will put pieces.
	chess_board.get_node("0 0").set_piece(black_rook)
	chess_board.get_node("0 1").set_piece(black_knight)
	chess_board.get_node("0 2").set_piece(black_bishop)
	chess_board.get_node("0 3").set_piece(black_queen)
	chess_board.get_node("0 4").set_piece(black_king)
	chess_board.get_node("0 5").set_piece(black_bishop)
	chess_board.get_node("0 6").set_piece(black_knight)
	chess_board.get_node("0 7").set_piece(black_rook)
	mass_pawn_spawning(1, 8, black_pawn)
	
	chess_board.get_node("7 0").set_piece(white_rook)
	chess_board.get_node("7 1").set_piece(white_knight)
	chess_board.get_node("7 2").set_piece(white_bishop)
	chess_board.get_node("7 3").set_piece(white_queen)
	chess_board.get_node("7 4").set_piece(white_king)
	chess_board.get_node("7 5").set_piece(white_bishop)
	chess_board.get_node("7 6").set_piece(white_knight)
	chess_board.get_node("7 7").set_piece(white_rook)
	mass_pawn_spawning(6, 8, white_pawn)

func mass_pawn_spawning(row: int, amount: int, pawn: CompressedTexture2D):
	var chess_board = get_node("chess_board")
	var number = 0
	while number != amount:
		chess_board.get_node(str(row) + " " + str(number)).set_piece(pawn)
		number += 1

func select(selected_square: CompressedTexture2D, place: String):
	var chess_board = get_node("chess_board")
	if selected == "" && selected_square != null:
		# This is for selecting
		selected = place
		piece = selected_square
	elif white_turn == true && var_to_str(piece).contains("W") && (selected_square == null || var_to_str(selected_square).contains("B")):
		# These two if statements are for capturing
		chess_board.get_node(selected).set_piece(null)
		chess_board.get_node(place).set_piece(piece)
		selected = ""
		white_turn = !white_turn
	elif white_turn == false && var_to_str(piece).contains("B") && (selected_square == null || var_to_str(selected_square).contains("W")):
		chess_board.get_node(selected).set_piece(null)
		chess_board.get_node(place).set_piece(piece)
		selected = ""
		white_turn = !white_turn
	elif selected != "" && selected_square != null:
		# In case those aren't correct, then reselect a thing.
		selected = place
		piece = selected_square
