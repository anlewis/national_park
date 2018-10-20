require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/park'
require './lib/car'
require './lib/person'

class ParkTest < MiniTest::Test
  def setup
    @park = Park.new(8)
  end

  def test_it_exists
    assert_instance_of Park, @park
  end

  def test_it_initializes_with_no_cars
    assert_equal [], @park.cars
  end

  def test_it_has_an_adult_fee
    assert_equal 8, @park.adult_fee
  end

  def test_it_can_add_one_car
    car = Car.new
    @park.add_car(car)

    assert_equal 1, @park.cars.count
    assert_equal car, @park.cars.first
  end

  def test_it_can_add_car_with_people
    charlie = Person.new({"name" => "Charlie", "age" => 18})
    jude = Person.new({"name" => "Jude", "age" => 20})
    taylor = Person.new({"name" => "Taylor", "age" => 12})

    car = Car.new

    car.add_passenger(charlie)
    car.add_passenger(jude)
    car.add_passenger(taylor)

    @park.add_car(car)

    assert_equal 1, @park.cars.count
    assert_equal [charlie, jude, taylor], @park.cars.first.passengers
  end

  def test_it_can_count_all_adults_in_all_cars
    charlie = Person.new({"name" => "Charlie", "age" => 18})
    jude = Person.new({"name" => "Jude", "age" => 20})
    taylor = Person.new({"name" => "Taylor", "age" => 12})

    car = Car.new

    car.add_passenger(charlie)
    car.add_passenger(jude)
    car.add_passenger(taylor)

    @park.add_car(car)

    assert_equal 2, @park.total_adults
  end

  def test_it_can_calculate_revenue_for_one_car
    charlie = Person.new({"name" => "Charlie", "age" => 18})
    jude = Person.new({"name" => "Jude", "age" => 20})
    taylor = Person.new({"name" => "Taylor", "age" => 12})

    car = Car.new

    car.add_passenger(charlie)
    car.add_passenger(jude)
    car.add_passenger(taylor)

    @park.add_car(car)

    assert_equal 16, @park.revenue
  end
end