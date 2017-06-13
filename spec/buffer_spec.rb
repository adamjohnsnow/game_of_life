require 'buffer'

describe Buffer do

  it 'buffers a simple 3x3 array with a layer of zeros' do
    buffer = Buffer.new([
      [1, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
    expect(buffer.output).to eq [
      [0, 0, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ]
  end

  it 'buffers a simple 5x4 array with a layer of zeros' do
    buffer = Buffer.new([
      [0, 0, 1, 0, 0],
      [1, 1, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 1, 0, 1, 0]
      ])
    expect(buffer.output).to eq [
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0],
      [0, 1, 1, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 1, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0]
    ]
  end
end
