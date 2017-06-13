class Neighbourhood
  attr_reader :output

  def initialize(arrays)
    @input = arrays
    @output = check_neighbourhood
  end

  def check_neighbourhood
    return 1 if sum_neighbours == 3
    return 1 if sum_neighbours == 2 && @input[1][1] == 1
    return 0
  end

  def sum_neighbours
    @input.flatten.inject(:+) - @input[1][1]
  end
end
