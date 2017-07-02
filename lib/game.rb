class Game
  require_relative './analyser'
  require_relative './random_grid'
  attr_reader :out_array, :in_array

  def initialize(array = RandomGrid.create)
    @out_array = array
  end

  def tick(ticks)
    ticks.times do
      @in_array = @out_array
      @out_array = Analyser.analyse(@in_array)
    end
    @out_array
  end

end
