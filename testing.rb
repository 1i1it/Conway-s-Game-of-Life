require './Board'

SUCCESS = "test passed"
FAIL = "test failed"

def integration_test(state_one, state_two)
	my_board = Board.new(state_one)
	my_board.print_board()
	my_board.next_turn()
	new_board = my_board.output_array() #(??)
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

	
	if board[11] == 1 && board[7] == 0 
		puts SUCCESS
	else 
		puts FAIL
	end 

	# play odd number of turns in the game
	9.times {my_board.next_turn()}
	new_board = my_board.output_array().flatten
	if new_board[11] == 0 && new_board[7] ==  1
		puts SUCCESS
	else 
		puts FAIL
	end 
end


build_board_test()
cell_at_position_test()
blinker_pattern_test()
beehive_pattern_test()


# todo check enforcing each law

