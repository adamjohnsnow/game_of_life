class Buffer
  attr_reader :in_array

  def initialize(array)
    @in_array = Array.new(array.length + 2) { Array.new(array[0].length + 2, 0) }
    array.each_with_index do |row, ind_x|
      row.each_with_index { |x, ind_y| @in_array[ind_x + 1][ind_y + 1] = x }
    end
  end

end
