class Game
  attr_reader :out_array, :in_array

  def initialize(array)
    @grid_height = array.length
    @grid_width = array[0].length
    @out_array = Array.new(@grid_height) { Array.new(@grid_width) }
    @in_array = Array.new(@grid_height + 2) { Array.new(@grid_width + 2, 0) }
    buffer(array)
  end

  def tick(ticks)
    ticks.times do
      @row = 1
      @col = 1
      do_all_cells
      buffer(@out_array)
    end
    @out_array
  end

  private

  def buffer(array)
    array.each_with_index do |row, ind_x|
      row.each_with_index { |x, ind_y| @in_array[ind_x + 1][ind_y + 1] = x }
    end
  end

  def do_all_cells
    while @row <= @grid_height
      do_row_check
      @col = 1
      @row += 1
    end
  end

  def do_row_check
    while @col <= @grid_width
      build_neighbourhood
      @col += 1
    end
  end

  def build_neighbourhood
    surrounds = [
      top_row_neighbours.inject(:+),
      side_neighbours.inject(:+),
      bottom_row_neighbours.inject(:+)
    ].inject(:+)
    test_for_life(@in_array[@row][@col], surrounds)
  end

  def top_row_neighbours
    return [
      @in_array[@row - 1][@col - 1],
      @in_array[@row - 1][@col],
      @in_array[@row - 1][@col + 1]
    ]
  end

  def side_neighbours
    return [
      @in_array[@row][@col - 1],
      @in_array[@row][@col + 1]
    ]
  end

  def bottom_row_neighbours
    return [
      @in_array[@row + 1][@col - 1],
      @in_array[@row + 1][@col],
      @in_array[@row + 1][@col + 1]
    ]
  end

  def test_for_life(centre, surrounds)
    @out_array[@row - 1][@col - 1] = 1 if surrounds == 3
    @out_array[@row - 1][@col - 1] = 1 if surrounds == 2 && centre == 1
    @out_array[@row - 1][@col - 1] = 0 if surrounds == 2 && centre.zero?
    @out_array[@row - 1][@col - 1] = 0 if surrounds < 2
    @out_array[@row - 1][@col - 1] = 0 if surrounds > 3
  end
end
