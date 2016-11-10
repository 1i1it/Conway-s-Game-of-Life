require './Cell'
class Board
	# I am assuming width and height are the same, since it is an inifinite board. 
	# number of cells is size*size (e.g size of 6 will create a board of 36)

	def initialize(size, initial_board=nil)
		
		@size = size
		@cells  = []
		@size.times do |x|
			@cells.push([])
			@size.times do |y|
				@cells[x].push(Cell.new(self, x, y))
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
		live_neighbors = board[x-1][y-1].value + 
		board[x-1][y].value + 
		board[x-1][(y+1) % n ].value + 
		board[x][y-1].value + 
		board[x][(y+1) % n].value + 
		board[(x+1) % n] [y-1].value + 
		board[(x+1) % n] [y].value + 
		board[(x+1) % n][(y+1) % n].value
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
end
