class Analyser
  attr_reader :output

  def initialize(input)
    @input = input
    @output = Array.new(input.length - 2) { Array.new(input[0].length - 2, 0) }
    @row = 1
    @col = 1
    do_all_cells
  end

  def do_all_cells
    while @row <= @output.length
      do_row_check
      @col = 1
      @row += 1
    end
  end

  def do_row_check
    while @col <= @output[0].length
      build_neighbourhood
      @col += 1
    end
  end

  def build_neighbourhood
    surrounds = [
      top_neighbours_sum,
      side_neighbours_sum,
      bottom_neighbours_sum
    ].inject(:+)
    test_for_life(@input[@row][@col], surrounds)
  end

  def top_neighbours_sum
    return [
      @input[@row - 1][@col - 1],
      @input[@row - 1][@col],
      @input[@row - 1][@col + 1]
    ].inject(:+)
  end

  def side_neighbours_sum
    return [
      @input[@row][@col - 1],
      @input[@row][@col + 1]
    ].inject(:+)
  end

  def bottom_neighbours_sum
    return [
      @input[@row + 1][@col - 1],
      @input[@row + 1][@col],
      @input[@row + 1][@col + 1]
    ].inject(:+)
  end

  def test_for_life(centre, surrounds)
    @output[@row - 1][@col - 1] = 1 if surrounds == 3
    @output[@row - 1][@col - 1] = 1 if surrounds == 2 && centre == 1
    @output[@row - 1][@col - 1] = 0 if surrounds == 2 && centre.zero?
    @output[@row - 1][@col - 1] = 0 if surrounds < 2
    @output[@row - 1][@col - 1] = 0 if surrounds > 3
  end
end
