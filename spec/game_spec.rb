require 'game'

describe Game do

  it 'buffers a simple array with a layer of zeros' do
    game = Game.new([
      [1, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
    expect(game.in_array).to eq [
      [0, 0, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ]
  end

  it 'steps a simple array #1' do
    game = Game.new([
      [1, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
    expect(game.step(1)).to eq([
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
  end

  it 'steps a simple array #2' do
    game = Game.new([
      [1, 1, 0],
      [0, 1, 0],
      [0, 0, 0]
      ])
    expect(game.step(1)).to eq([
      [0, 0, 0],
      [1, 0, 0],
      [0, 0, 0]
      ])
  end

  it 'steps a bigger array #1' do
    game = Game.new([
      [1, 1, 0, 0, 0],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0]
      ])
    expect(game.step(1)).to eq([
      [0, 1, 0, 1, 0],
      [1, 1, 1, 0, 0],
      [0, 0, 1, 1 ,0],
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0]
      ])
  end

  it 'double steps a simple array #1' do
    game = Game.new([
      [1, 1, 0],
      [0, 1, 0],
      [0, 0, 0]
      ])
    expect(game.step(2)).to eq([
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
  end
end
