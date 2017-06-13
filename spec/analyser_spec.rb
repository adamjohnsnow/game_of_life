require 'analyser'

describe Analyser do

  it 'takes buffered input, returns proper output' do
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
