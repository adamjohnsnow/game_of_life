class Analyser
  attr_reader :output

  def initialize(input)
    @input = input
    @output = Array.new(input.length - 2) { Array.new(input[0].length - 2, 0) }
    @row = 1
    @col = 1
    loop_each_row
  end

  private
  
  def loop_each_row
    while @row <= @output.length
      loop_each_column
      @col = 1
      @row += 1
    end
  end

  def loop_each_column
    while @col <= @output[0].length
      test_neighbourhood
      @col += 1
    end
  end

  def test_neighbourhood
    @centre = @input[@row][@col]
    @neighbourhood_total = sum_neighbours.inject(:+)
    test_for_life
  end

  def sum_neighbours
    [
      @input[@row - 1][@col - 1], @input[@row - 1][@col],
      @input[@row - 1][@col + 1], @input[@row][@col - 1],
      @input[@row][@col + 1], @input[@row + 1][@col - 1],
      @input[@row + 1][@col], @input[@row + 1][@col + 1]
    ]
  end

  def test_for_life
    @output[@row - 1][@col - 1] = 1 if @neighbourhood_total == 3
    @output[@row - 1][@col - 1] = 1 if @neighbourhood_total == 2 && @centre == 1
    @output[@row - 1][@col - 1] = 0 if @neighbourhood_total == 2 && @centre.zero?
    @output[@row - 1][@col - 1] = 0 if @neighbourhood_total < 2
    @output[@row - 1][@col - 1] = 0 if @neighbourhood_total > 3
  end
end
