require './Board'

SUCCESS = "test passed"
FAIL = "test failed"

def integration_test(state_one, state_two)
	my_board = Board.new(state_one)
	my_board.print_board()
	my_board.next_turn()
	new_board = my_board.output_array()
	my_board.print_board()
	if 
		my_board.test_array == state_two
		puts SUCCESS
	else
		puts FAIL, my_board.test_array 
	end
end

def blinker_pattern_test()
	# Oscillator pattern
	puts "running blinker"
	state_one = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
	state_two = [[0,0,0,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,0,0,0]]
	integration_test(state_one, state_two)
end

def beehive_pattern_test()
	# Still life pattern
	puts "running beehive"
	state_one =[[0,0,0,0,0,0],[0,0,1,1,0,0],[0,1,0,0,1,0],[0,0,1,1,0,0],[0,0,0,0,0,0], [0,0,0,0,0,0]]
	integration_test(state_one, state_one)
end

def toad_pattern_test()
	# Still life pattern
	puts "running toad_pattern_test"
	state_one = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,1,1,1,0],[0,1,1,1,0,0],[0,0,0,0,0,0], [0,0,0,0,0,0]]
	state_two =[[0,0,0,0,0,0],[0,0,0,1,0,0],[0,1,0,0,1,0],[0,1,0,0,1,0],[0,0,1,0,0,0], [0,0,0,0,0,0]]	
	integration_test(state_one, state_two)
end


def build_board_test()
	my_board = Board.new()
	length = my_board.output_array().flatten.length
	if length == 100
		puts SUCCESS
	else
		puts FAIL
	end
end

def cell_at_position_test()
	puts "running cell_at_position_test"
	pattern = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
	my_board = Board.new(pattern)
	board = my_board.output_array().flatten

	#compare to original array, flattened
	if board == pattern.flatten
		puts SUCCESS
	else 
		puts FAIL
	end

	# check position of two cells in the array
	if board[11] == 1 && board[7] == 0 
		puts SUCCESS
	else 
		puts FAIL
	end 

	# play odd number of turns in the game
	9.times {my_board.next_turn()}
	# check position of same two cells in the array
	new_board = my_board.output_array().flatten
	if new_board[11] == 0 && new_board[7] ==  1
		puts SUCCESS
	else 
		puts FAIL
	end 
end

def check_cell(original_array, new_array, coordinate_x, coordinate_y, toggle=false)
	print "running check_cell"
	if toggle
		if original_array[coordinate_x][coordinate_y] != new_array [coordinate_x][coordinate_y]
			puts SUCCESS
		else
			puts FAIL
		end
	else 
		if original_array[coordinate_x][coordinate_y] == new_array[coordinate_x][coordinate_y]
			puts SUCCESS
		else
			puts FAIL
		end
	end
end

def laws_test()
	print "running laws_test"
	state_one = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,1,1,1,0],[0,1,1,1,0,0],[0,0,0,0,0,0], [0,0,0,0,0,0]]
	state_two =[[0,0,0,0,0,0],[0,0,0,1,0,0],[0,1,0,0,1,0],[0,1,0,0,1,0],[0,0,1,0,0,0], [0,0,0,0,0,0]]

	#pattern1 to pattern2

	my_board = Board.new(state_one)
	my_board.next_turn()
	new_board = my_board.output_array()

	# alive with  2 neighbors, should live 
	check_cell(state_one, new_board, 3, 1)

    # alive with  > 3 neighbors, should die 
	check_cell(state_one, new_board, 3, 2, true)

	#pattern2 to pattern1

	my_board_state_two = Board.new(state_two)
	my_board_state_two.next_turn()
	new_board = my_board_state_two.output_array()
	
	# alive_with_one_neigbor, should become 0
	check_cell(state_two, new_board, 1, 3, true)
	
	# dead_with_3_neigbors, should become 1	
	check_cell(state_two, new_board, 2, 2, true)

end

build_board_test()
cell_at_position_test()
blinker_pattern_test()
beehive_pattern_test()
toad_pattern_test
laws_test



