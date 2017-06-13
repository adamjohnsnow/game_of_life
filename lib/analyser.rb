module Analyser

  def self.analyse(grid)
    @grid = grid
    @results = Array.new(grid.length - 2) { Array.new(grid[0].length - 2, 0) }
    @row = 1
    @col = 1
    loop_each_row
    return @results
  end

  def self.loop_each_row
    while @row <= @results.length
      loop_each_column
      @col = 1
      @row += 1
    end
  end

  def self.loop_each_column
    while @col <= @results[0].length
      analysis = Neighbourhood.check(create_neighbourhood_array)
      @results[@row - 1][@col - 1] = analysis
      @col += 1
    end
  end

  def self.create_neighbourhood_array
    [
      @grid[@row - 1][@col - 1..@col + 1],
      @grid[@row][@col - 1..@col + 1],
      @grid[@row + 1][@col - 1..@col + 1]
    ]
  end
end
