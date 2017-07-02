class RandomGrid

  attr_reader :grid

  def self.create(size)
    grid = []
    size.times do
      grid << new_row(size)
    end
    return grid
  end

  def self.new_row(length)
    row = []
    length.times do
      row << rand(0..1)
    end
    return row
  end

end
