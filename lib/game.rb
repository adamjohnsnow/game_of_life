class Game
  require_relative './buffer'
  attr_reader :out_array, :in_array

  def initialize(array)
    @out_array = array
    @in_array = Buffer.new(array).in_array
  end

  def tick(ticks)
    ticks.times do
      @in_array = Buffer.new(@out_array).in_array
      @row = 1
      @col = 1
      do_all_cells
    end
    @out_array
  end

  private

  def do_all_cells
    while @row <= @out_array.length
      do_row_check
      @col = 1
      @row += 1
    end
  end

  def do_row_check
    while @col <= @out_array[0].length
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
    test_for_life(@in_array[@row][@col], surrounds)
  end

  def top_neighbours_sum
    return [
      @in_array[@row - 1][@col - 1],
      @in_array[@row - 1][@col],
      @in_array[@row - 1][@col + 1]
    ].inject(:+)
  end

  def side_neighbours_sum
    return [
      @in_array[@row][@col - 1],
      @in_array[@row][@col + 1]
    ].inject(:+)
  end

  def bottom_neighbours_sum
    return [
      @in_array[@row + 1][@col - 1],
      @in_array[@row + 1][@col],
      @in_array[@row + 1][@col + 1]
    ].inject(:+)
  end

  def test_for_life(centre, surrounds)
    @out_array[@row - 1][@col - 1] = 1 if surrounds == 3
    @out_array[@row - 1][@col - 1] = 1 if surrounds == 2 && centre == 1
    @out_array[@row - 1][@col - 1] = 0 if surrounds == 2 && centre.zero?
    @out_array[@row - 1][@col - 1] = 0 if surrounds < 2
    @out_array[@row - 1][@col - 1] = 0 if surrounds > 3
  end
end
