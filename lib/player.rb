class Player

	def initialize name
		@name = name
	end

	def name
		@name
	end

	def shoot(at_coordinates, opponent_board)
		opponent_board.register_shot(at_coordinates)
	end

end