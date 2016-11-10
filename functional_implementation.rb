def build_board(width, height)
	board  = []
	height.times do |x|
		board.push([])
		width.times do |y|
			board[x].push([0,1].sample)
		end
	end
	board
end


def print_board(board)
  puts "printing board"
  board.each {|row| 
    row.each {|cell|
    	if cell == 1
    		char = "*"
    	else 
    		char = "_"
    	end
    	print char
    }
   puts ''
  }
end

def calculate_cell_value(board, x, y)
	# calculate value of one cell
    n = board.size
	neighbor_value = board[x-1][y-1] + 
	board[x-1][y] + 
	board[x-1][(y+1) % n ] + 
	board[x][y-1] + 
	board[x][(y+1) % n] + 
	board[(x+1) % n] [y-1] + 
	board[(x+1) % n] [y] + 
	board[(x+1) % n][(y+1) % n]

	if board[x][y] == 0 #if cell is dead
		if neighbor_value == 3
			cell_value = 1
		else 
			cell_value = 0
		end
	else #if cell is alive
		if neighbor_value < 2
			cell_value = 0
		elsif neighbor_value > 3
			cell_value = 0
		else
			cell_value = 1
		end
	end
	cell_value
end

def build_new_board(old_board, width, height)

	new_board = build_board(width, height)
	height.times do |x|
		width.times do |y|
			new_board[x][y] = calculate_cell_value(old_board, x, y)
		end
	end
	new_board
end

def run
	size = 5
	board = [[0,0,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,1,1,1,0],[0,0,0,0,0]]
	while true
		puts '======='
		print_board(board)
		board = build_new_board(board, size, size)
		sleep 1
	end
end

run