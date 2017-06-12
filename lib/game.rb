class Game
  attr_reader :out_array, :in_array

  def initialize(array)
    @array_length = array.length
    @out_array = Array.new(@array_length){ Array.new(@array_length) }
    @in_array = buffer(array)
  end

  def step(i)
    i.times do
      @row = 1
      @col = 1
      do_all_cells
    end
    @out_array
  end

  private

  def buffer(array)
    array.insert(0, [0] * @array_length)
    array << [0] * @array_length
    array.each do |row|
      row.insert(0, 0)
      row << 0
    end
  end

  def do_all_cells
    while @row <= @array_length
      do_row_check
      @col = 1
      @row += 1
    end
  end

  def do_row_check
    while @col <= @array_length
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
    test_for_life(@in_array[@row][@col], neighbourhood)
  end

  def test_for_life(kingpin, neighbourhood)
    @out_array[@row-1][@col-1] = 1 if neighbourhood.inject(:+) == 3
    @out_array[@row-1][@col-1] = 0 if neighbourhood.inject(:+) < 3
    @out_array[@row-1][@col-1] = 0 if neighbourhood.inject(:+) > 3
  end
end
