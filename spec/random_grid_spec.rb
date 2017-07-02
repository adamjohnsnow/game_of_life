require 'random_grid'

describe 'random grids' do

  it 'generates grid' do
    grid = RandomGrid.create()
    expect(grid.length).to eq(RandomGrid::ROWS)
    expect(grid[0].length).to eq(RandomGrid::COLUMNS)
  end

end
