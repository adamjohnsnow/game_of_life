require 'analyser'

describe Analyser do

  it 'takes buffered 5x5 input, returns proper 3x3 output' do
    analysis = Analyser.new([
      [0, 0, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ])
    expect(analysis.output).to eq [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ]
  end

  it 'takes buffered 7x6 input, returns proper 5x4 output' do
    analysis = Analyser.new([
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0],
      [0, 1, 1, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 1, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0]
    ])
    expect(analysis.output).to eq [
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 0, 0],
      [0, 0, 0, 0, 0]
    ]
  end

end
