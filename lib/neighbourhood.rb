module Neighbourhood

  def self.check(neighbourhood)
    return 1 if sum_neighbours(neighbourhood) == 3
    return 1 if sum_neighbours(neighbourhood) == 2 && neighbourhood[1][1] == 1
    return 0
  end
  
  def self.sum_neighbours(neighbourhood)
    neighbourhood.flatten.inject(:+) - neighbourhood[1][1]
  end
end
