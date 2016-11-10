require './Board'

SUCCESS = "test passed"
FAIL = "test failed"

def integration_test(state_one, state_two)
	my_board = Board.new(state_one)
	my_board.print_board()
	my_board.next_turn()
	new_board = my_board.output_array()
	if 
		my_board.test_array == state_two
		puts SUCCESS
	else
		puts FAIL, my_board.test_array 
	end
end

def blinker()
	# Oscillator pattern
	puts "running blinker"
	state_one = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
	state_two = [[0,0,0,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,0,0,0]]
	integration_test(state_one, state_two)
end

def beehive()
	puts "running beehive"
	# Still life pattern
	state_one =[[0,0,0,0,0,0],[0,0,1,1,0,0],[0,1,0,0,1,0],[0,0,1,1,0,0],[0,0,0,0,0,0], [0,0,0,0,0,0]]
	integration_test(state_one, state_one)
end

blinker()
beehive()

# class Test
# 	def initialize()
# 	end
# 	def testing(blinker)
# 		# write tests for some config - simple config, run it 100 times, see what I get
# 	end

# 	def unitest()
# 		build_board
# 		calculate_cell_value

# 	def blinker()
# 		state_one = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
# 		state_two = [[0,0,0,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,0,0,0]]
# 		my_board = Board.new(state_one)
# 		if 
# 			Board.cells == state_two
# 			puts "great"
# 		else
# 			puts "bad", Board.cells 
# 	end

	

# glider = [[0,0,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,1,1,1,0],[0,0,0,0,0]]


# # testing - create board and make sure there are N cells.
# if all cells are 0, should return all dead
