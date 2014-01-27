require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
	
	let(:board) { Board.new(player) }
	let(:player) { Player.new(:name) }

	it 'should recognise its owner' do
		expect(board.owner).to be(player.name)
	end

	it 'has a hundred elements' do
		expect(board.rows.join.length).to eq 100
	end

	it 'has 10 rows' do
		expect(board.rows.length).to eq 10
	end

	it 'shoots at the water' do
		expect(board.register_shot('A1')).to eq 'o'
	end

	it 'registers the shot on the board after shooting' do
		board.register_shot('A1')
		expect(board.rows.join.include?('o')).to be_true
	end

	it 'registers the shot at the position we shot at (A1)' do
		board.register_shot('A1')
		expect(board.rows[0][0]).to eq 'o'
	end

	it 'registers the shot at the position we shot at (A2)' do
		board.register_shot('A2')
		expect(board.rows[0][1]).to eq 'o'
	end

	context 'coordinates' do
		context 'splitting' do
			it 'A1' do
				expect(board.to_coordinates('A1')).to eq ['A', 1]
			end

			it 'B2' do
				expect(board.to_coordinates('B2')).to eq ['B', 2]
			end
			it 'C10' do
				expect(board.to_coordinates('C10')).to eq ['C', 10]
			end
		end

		context 'querying' do
			it 'shows us that A1 is empty' do
				expect(board.element_at('A1')).to eq ' '
			end

			it 'shows us that A1 has been shot at' do
				board.register_shot('A1')
				expect(board.element_at('A1')).to eq 'o'
			end
		end
	end

	context "adding ships to the board" do 
		it "adds a ship from A1" do
			board.add_ship('A1', 1)
			expect(board.element_at('A1')).to eq 's'
		end

		it "adds a ship from A1" do
			board.add_ship('A1', 2)
			expect(board.element_at('A1')).to eq 's'
			expect(board.element_at('A2')).to eq 's'
		end
	end
end