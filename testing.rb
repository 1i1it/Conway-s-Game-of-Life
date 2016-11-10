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

def build_board()
	my_board = Board.new()
	length = my_board.output_array().flatten.length
	if length == 100
		puts SUCCESS
	else
		puts FAIL
	end
end

def cell_at_position()
	pattern = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
	my_board = Board.new(pattern)
	board = my_board.output_array().flatten
	if board[11] == 1 && board[7] == 0 
		puts SUCCESS
	else 
		puts FAIL
	end 
	my_board.next_turn()
	new_board = my_board.output_array().flatten
	if new_board[11] == 0 && new_board[7] ==  1
		puts SUCCESS
	else 
		puts FAIL
	end 
end


build_board()
cell_at_position()
blinker()
beehive()
