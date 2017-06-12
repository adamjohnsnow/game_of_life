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

  it 'ticks a simple array #1' do
    game = Game.new([
      [1, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
    expect(game.tick(1)).to eq([
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
  end

  it 'ticks a simple array #2' do
    game = Game.new([
      [1, 1, 0],
      [0, 1, 0],
      [0, 0, 0]
      ])
    expect(game.tick(1)).to eq([
      [1, 1, 0],
      [1, 1, 0],
      [0, 0, 0]
      ])
  end

  it 'ticks a bigger array' do
    game = Game.new([
      [1, 1, 0, 0, 0],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
      ])
    expect(game.tick(1)).to eq([
      [1, 1, 0, 1, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
      ])
  end

  it 'double ticks a simple array #1' do
    game = Game.new([
      [1, 1, 0],
      [0, 0, 0],
      [0, 1, 0]
      ])
    expect(game.tick(2)).to eq([
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
  end

  it 'double ticks a simple array #2' do
    game = Game.new([
      [1, 1, 0],
      [0, 1, 0],
      [0, 1, 0]
      ])
    expect(game.tick(2)).to eq([
      [1, 1, 1],
      [1, 1, 1],
      [0, 0, 0]
      ])
  end

  it 'double ticks a bigger array' do
    game = Game.new([
      [1, 1, 0, 0, 0],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
      ])
    expect(game.tick(2)).to eq([
      [1, 0, 0, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
      ])
  end

  it 'works with non-square grid' do
    game = Game.new([
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 0],
      [1, 0, 1, 0, 0],
      [0, 1, 1, 1, 0]
      ])
    expect(game.tick(2)).to eq([
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 1, 0, 1, 0],
      [0, 1, 0, 1, 0]
      ])
  end

  it '20 ticks on stable pattern' do
    game = Game.new([
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0]
      ])
    expect(game.tick(20)).to eq([
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0]
      ])
  end

  it '200 ticks on stable pattern' do
    game = Game.new([
      [0, 1, 1, 0],
      [1, 0, 0, 1],
      [0, 1, 1, 0]
      ])
    expect(game.tick(200)).to eq([
      [0, 1, 1, 0],
      [1, 0, 0, 1],
      [0, 1, 1, 0]
      ])
  end

  it 'Conway\'s drifting glider shape' do
    game = Game.new([
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 1, 1, 1],
      [0, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 1, 0]
      ])
    expect(game.tick(4)).to eq([
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0]
      ])
    expect(game.tick(16)).to eq([
      [1, 1, 1, 0, 0, 0, 0, 0],
      [1, 0, 0, 0, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0]
      ])
  end

end
