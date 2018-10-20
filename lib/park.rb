class Park
  attr_reader :cars, :adult_fee

  def initialize(adult_fee)
    @cars = []
    @adult_fee = adult_fee
  end

  def add_car(car)
    @cars << car
  end

  def revenue
    total_adults * adult_fee
  end

  def total_adults
    cars.map(&:num_adults).inject(:+)
  end
end