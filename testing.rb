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
	# Still life pattern
	puts "running beehive"
	state_one =[[0,0,0,0,0,0],[0,0,1,1,0,0],[0,1,0,0,1,0],[0,0,1,1,0,0],[0,0,0,0,0,0], [0,0,0,0,0,0]]
	integration_test(state_one, state_one)
end

blinker()
beehive()
