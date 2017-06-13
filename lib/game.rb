class Game
  require_relative './buffer'
  attr_reader :out_array, :in_array

  def initialize(array)
    @out_array = array
  end

  def tick(ticks)
    ticks.times do
      @in_array = Buffer.new(@out_array).output
      @out_array = Analyser.new(@in_array).output
    end
    @out_array
  end

end
