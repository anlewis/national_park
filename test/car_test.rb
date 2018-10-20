require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'
require './lib/car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_it_exists
    assert_instance_of Car, @car
  end

  def test_it_initializes_with_not_passengers
    assert_equal [], @car.passengers
  end

  def test_it_can_have_one_passenger
    charlie = Person.new({"name" => "Charlie", "age" => 18})
    @car.add_passenger(charlie)

    assert_equal 1, @car.passengers.count
    assert_equal charlie, @car.passengers.first
  end

  def test_it_can_have_multiple_passengers
    charlie = Person.new({"name" => "Charlie", "age" => 18})
    jude = Person.new({"name" => "Jude", "age" => 20})
    taylor = Person.new({"name" => "Taylor", "age" => 12})
    @car.add_passenger(charlie)
    @car.add_passenger(jude)
    @car.add_passenger(taylor)

    assert_equal [charlie, jude, taylor], @car.passengers
  end

  def test_it_can_count_adults_in_car
    charlie = Person.new({"name" => "Charlie", "age" => 18})
    jude = Person.new({"name" => "Jude", "age" => 20})
    taylor = Person.new({"name" => "Taylor", "age" => 12})
    @car.add_passenger(charlie)
    @car.add_passenger(jude)
    @car.add_passenger(taylor)

    assert_equal 2, @car.num_adults
  end
end