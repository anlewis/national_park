class Car
  attr_reader :passengers

  def initialize
    @passengers = []
  end

  def add_passenger(person)
    @passengers << person
  end

  def num_adults
    passengers.select do |person|
      person.adult?
    end.count
  end
end