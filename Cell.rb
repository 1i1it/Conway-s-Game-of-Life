ALIVE_VALUE = 1
DEAD_VALUE = 0
class Cell
	def initialize(board, x, y, value=nil)
    @myboard, @x, @y = board, x, y
    if value
    	@alive = value
    else
    	@alive = [DEAD_VALUE, ALIVE_VALUE].sample
    end
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
  	neighbor_value = @myboard.num_live_neighbors(@x, @y)

	if !is_alive? #if cell is dead
		if neighbor_value == 3
			@new_generation_value = ALIVE_VALUE
		else 
			@new_generation_value = DEAD_VALUE
		end
	else #if cell is alive
		if neighbor_value < 2
			@new_generation_value = DEAD_VALUE
		elsif neighbor_value > 3
			@new_generation_value = DEAD_VALUE
		else
			@new_generation_value = ALIVE_VALUE
		end
	end
  end
	

	def update_to_new_gen_value()
		@alive = @new_generation_value
		@new_generation_value = nil
	end

end # end of Class