require 'neighbourhood'

describe Neighbourhood do

  it 'returns 0 on an underpopulated neighbourhood' do
    neighbourhood = Neighbourhood.new([[0, 0, 0], [0, 1, 0], [1, 0, 0]])
    expect(neighbourhood.output).to eq 0
  end

  it 'returns 1 on an populated neighbourhood with 1 in centre' do
    neighbourhood = Neighbourhood.new([[0, 0, 0], [1, 1, 0], [1, 0, 0]])
    expect(neighbourhood.output).to eq 1
  end

  it 'returns 1 on an populated neighbourhood with 0 in centre' do
    neighbourhood = Neighbourhood.new([[0, 1, 0], [1, 0, 0], [1, 0, 0]])
    expect(neighbourhood.output).to eq 1
  end

  it 'returns 0 on an overpopulated neighbourhood' do
    neighbourhood = Neighbourhood.new([[1, 1, 1], [0, 1, 0], [1, 0, 0]])
    expect(neighbourhood.output).to eq 0
  end
end
