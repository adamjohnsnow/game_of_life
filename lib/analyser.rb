module Analyser
  require_relative './neighbourhood'

  def self.analyse(grid)
    @grid = grid
    @results = Array.new(grid.length) { Array.new(grid[0].length, 0) }
    @row = 0
    @col = 0
    loop_each_row
    return @results
  end

  def self.loop_each_row
    while @row < @results.length
      loop_each_column
      @col = 0
      @row += 1
    end
  end

  def self.loop_each_column
    while @col < @results[0].length
      analysis = Neighbourhood.check(create_neighbourhood_array)
      @results[@row][@col] = analysis
      @col += 1
    end
  end

  def self.create_neighbourhood_array
    [
      [get_neighbours(@row - 1, @col - 1),
      get_neighbours(@row - 1, @col),
      get_neighbours(@row - 1, @col + 1)],
      [get_neighbours(@row, @col - 1),
      get_neighbours(@row, @col),
      get_neighbours(@row, @col + 1)],
      [get_neighbours(@row + 1, @col - 1),
      get_neighbours(@row + 1, @col),
      get_neighbours(@row + 1, @col + 1)]
    ]
  end

  def self.get_neighbours(row, col)
    return 0 unless row >= 0 && row < @grid.length && col >= 0 && col < @grid[0].length
    @grid[row][col]
  end

end
