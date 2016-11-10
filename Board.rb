require './Cell'
class Board
	attr_reader :test_array
	# I am assuming width and height are the same, since it is an inifinite board. 
	# number of cells is size*size (e.g size of 6 will create a board of 36)

	def initialize(initial_board=nil)
		@size = initial_board && initial_board.length || 10
		@initial_board = initial_board # used when existing patterns are passed
		@cells  = []
		
		if @initial_board
			@size.times do |x|
				@cells.push([])
				@size.times do |y|
					@cells[x].push(Cell.new(self, x, y, @initial_board[x][y]))
				end
			end
		else
			@size.times do |x|
				@cells.push([])
				@size.times do |y|
					@cells[x].push(Cell.new(self, x, y))
				end
			end
		end

	end

	def print_board()
		  puts "printing board"
		  @cells.each {|row| 
		    row.each {|cell|
		    	cell.print_cell
		    }
		   puts ''
		  }
	end

	def num_live_neighbors(x,y)
		board = @cells
		n = @size
		# ruby wraps the board when negative values are involved
		live_neighbors = board[x-1][y-1].value + 
		board[x-1][y].value + 
		board[x-1][(y+1) % n ].value + 
		board[x][y-1].value + 
		board[x][(y+1) % n].value + 
		board[(x+1) % n] [y-1].value + 
		board[(x+1) % n] [y].value + 
		board[(x+1) % n][(y+1) % n].value
		live_neighbors
	end

	def next_turn()
		@cells.each {|row| 
			row.each {|cell|
			   cell.calculate_new_cell_value()
			}
		}

		 @cells.each {|row| 
			row.each {|cell|
			    cell.update_to_new_gen_value()
			}
		}
	end

	def output_array()
		# function used for testing
		@test_array = []
		@size.times do |x|
			@test_array.push([])
			@size.times do |y|
				test_array[x].push(@cells[x][y].value)
			end
		end
		@test_array
    end
end
