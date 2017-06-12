require 'game'

describe Game do

  it 'buffers a simple array with a layer of nils' do
    game = Game.new([
      [1, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ])
    expect(game.in_array).to eq [
      [nil, nil, nil, nil, nil],
      [nil, 1, 0, 0, nil],
      [nil, 0, 0, 0, nil],
      [nil, 0, 0, 0, nil],
      [nil, nil, nil, nil, nil]
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
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0]
      ])
    expect(game.tick(1)).to eq([
      [1, 1, 0, 1, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 1, 1 ,0],
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0]
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
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0]
      ])
    expect(game.tick(1)).to eq([
      [1, 1, 0, 1, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 1, 1 ,0],
      [0, 0, 0, 0 ,0],
      [0, 0, 0, 0 ,0]
      ])
  end
end
