class RandomGrid

  attr_reader :grid

  ROWS = 40
  COLUMNS = 80

  def self.create()
    grid = []
    ROWS.times do
      grid << new_row
    end
    grid
  end

  def self.new_row
    row = []
    COLUMNS.times do
      row << rand(0..1)
    end
    row
  end

end
