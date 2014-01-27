class Board
	def initialize player
		@player = player
		@columns = ('A'..'J').to_a
		@board = [
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					[" "," "," ", " ", " ", " ", " ", " ", " ", " "],
					]
	end

	def owner
		@player.name
	end

	def register_shot(coordinates)
		replace_at(coordinates, 'o')
	end

	def rows
		@board
	end

	def to_coordinates(string)
		coordinates = string.split(//,2)
		coordinates[1]=coordinates[1].to_i
		coordinates
	end

	def element_at(string)
		coordinates = to_coordinates(string)
		@board[@columns.index(coordinates[0])][coordinates[1]-1]
	end

	def add_ship(coordinates, ship_size)
			replace_at(coordinates, 's')		
			# replace_at(coordinates, 's')

	end

	private
	def replace_at(position, with)
			coordinates = to_coordinates(position)
			@board[@columns.index(coordinates[0])][coordinates[1]-1]=with
	end

end