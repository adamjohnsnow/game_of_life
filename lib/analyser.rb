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
      analysis = Neighbourhood.new(create_neighbourhood_array).output
      @output[@row - 1][@col - 1] = analysis
      @col += 1
    end
  end

  def create_neighbourhood_array
    [
      @input[@row - 1][@col - 1..@col + 1],
      @input[@row][@col - 1..@col + 1],
      @input[@row + 1][@col - 1..@col + 1]
    ]
  end
end
