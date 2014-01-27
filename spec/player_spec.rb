require_relative '../lib/player'

describe 'Player' do

	let(:player) { Player.new('kalle') }

	it 'should allow to initialize a new player' do		
		expect(player.name).to eq('kalle')
	end

	it 'shoots at the opponents board' do
		opponents_board = double :board
		expect(opponents_board).to receive(:register_shot).with('A1')
		player.shoot('A1', opponents_board)
	end

end