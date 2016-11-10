require './Board'

# TODO TO BE ABLE TO PASS PATTERNS
# create method on Board, that takes an array, and turns each item into an object, setting @alive to received value
def run
	my_board = Board.new(5)
	#size = 5
	#board = build_board(10, 10)
	#board = [[0,0,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,1,1,1,0],[0,0,0,0,0]]

	while true
		puts '======='
		my_board.print_board()
		sleep 1
		my_board.next_turn()
		sleep 1

	end
end

run()

#board = build_new_board(board, size, size)
