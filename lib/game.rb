class Game
  attr_reader :out_array, :in_array

  def initialize(array)
    @grid_height = array.length
    @grid_width = array[0].length
    @out_array = Array.new(@grid_height){ Array.new(@grid_width) }
    @in_array = Array.new(@grid_height + 2){ Array.new(@grid_width + 2) }
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
    neighbourhood = [
      @in_array[@row - 1][@col - 1],
      @in_array[@row - 1][@col],
      @in_array[@row - 1][@col + 1],
      @in_array[@row][@col - 1],
      @in_array[@row][@col + 1],
      @in_array[@row + 1][@col - 1],
      @in_array[@row + 1][@col],
      @in_array[@row + 1][@col + 1]
    ]
    neighbourhood -= [nil]
    test_for_life(@in_array[@row][@col], neighbourhood)
  end

  def test_for_life(kingpin, neighbourhood)
    @out_array[@row-1][@col-1] = 1 if neighbourhood.inject(:+) == 3
    @out_array[@row-1][@col-1] = 1 if neighbourhood.inject(:+) == 2 && kingpin == 1
    @out_array[@row-1][@col-1] = 0 if neighbourhood.inject(:+) == 2 && kingpin == 0
    @out_array[@row-1][@col-1] = 0 if neighbourhood.inject(:+) < 2
    @out_array[@row-1][@col-1] = 0 if neighbourhood.inject(:+) > 3
  end
end
