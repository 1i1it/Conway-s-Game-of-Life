require './Board'

def run
	puts "Please put your pattern or press Enter to have random pattern"
	user_input = gets
	pattern = eval(user_input) || nil
	my_board = Board.new(pattern)
	puts '=============='
	puts "Let's begin the game!"
	puts '=============='
	while true
		puts '=============='
		my_board.print_board()
		sleep 1
		my_board.next_turn()
		sleep 1

	end
end

run()