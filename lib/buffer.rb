module Buffer

  def self.add_buffer(array)
    output = Array.new(array.length + 2) { Array.new(array[0].length + 2, 0) }
    array.each_with_index do |row, ind_x|
      row.each_with_index { |x, ind_y| output[ind_x + 1][ind_y + 1] = x }
    end
    return output
  end

end
