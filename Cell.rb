class Cell
	def initialize(board, x, y)
    @myboard, @x, @y = board, x, y
    @alive = [0,1].sample
    @new_generation_value = nil
  end

  def is_alive?
  	@alive == 1
  end


  def print_cell()
  	if is_alive?
		char = "*"
	else 
		char = "_"
	end
	print char
  end

  def value()
  	@alive
  end

  def calculate_new_cell_value()
  	#board = @board.cells
  	neighbor_value = @myboard.num_live_neighbors(@x, @y)

	if !@alive #if cell is dead
		if neighbor_value == 3
			@new_generation_value = 1
		else 
			@new_generation_value = 0
		end
	else #if cell is alive
		if neighbor_value < 2
			@new_generation_value = 0
		elsif neighbor_value > 3
			@new_generation_value = 0
		else
			@new_generation_value = 1
		end
	end
  end
	

	def update_to_new_gen_value()
		@alive = @new_generation_value
		@new_generation_value = nil
	end

end # end of Class