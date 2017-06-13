class Game
  require_relative './buffer'
  require_relative './analyser'
  attr_reader :out_array, :in_array

  def initialize(array)
    @out_array = array
  end

  def tick(ticks)
    ticks.times do
      @in_array = Buffer.add_buffer(@out_array)
      @out_array = Analyser.analyse(@in_array)
    end
    @out_array
  end

end
