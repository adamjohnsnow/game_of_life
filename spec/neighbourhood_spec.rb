require 'neighbourhood'

describe Neighbourhood do

  it 'returns 0 on an underpopulated neighbourhood' do
    neighbourhood = Neighbourhood.check([[0, 0, 0], [0, 1, 0], [1, 0, 0]])
    expect(neighbourhood).to eq 0
  end

  it 'returns 1 on an populated neighbourhood with 1 in centre' do
    neighbourhood = Neighbourhood.check([[0, 0, 0], [1, 1, 0], [1, 0, 0]])
    expect(neighbourhood).to eq 1
  end

  it 'returns 1 on an populated neighbourhood with 0 in centre' do
    neighbourhood = Neighbourhood.check([[0, 1, 0], [1, 0, 0], [1, 0, 0]])
    expect(neighbourhood).to eq 1
  end

  it 'returns 0 on an overpopulated neighbourhood' do
    neighbourhood = Neighbourhood.check([[1, 1, 1], [0, 1, 0], [1, 0, 0]])
    expect(neighbourhood).to eq 0
  end
end
