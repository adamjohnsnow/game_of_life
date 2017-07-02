require 'random_grid'

describe 'random grids' do

  it 'generates grid with 10 rows' do
    grid = RandomGrid.create(10)
    expect(grid.length).to eq(10)
  end

  it 'generates grid with 10 columns' do
    grid = RandomGrid.create(10)
    expect(grid[0].length).to eq(10)
  end

  it 'generates a 100x100 grid' do
    grid = RandomGrid.create(100)
    expect(grid.length).to eq(100)
    expect(grid[99].length).to eq(100)
  end

end
