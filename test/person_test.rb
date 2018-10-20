require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'

class PersonTest < MiniTest::Test
  def setup
    @charlie = Person.new({"name" => "Charlie", "age" => 18})
    @pam = Person.new({"name" => "Pam", "age" => 16})
  end

  def test_it_exists
    assert_instance_of Person, @charlie
  end

  def test_it_has_name
    assert_equal 'Charlie', @charlie.name
  end

  def test_it_has_age
    assert_equal 18, @charlie.age
  end

  def test_it_can_be_an_adult
    assert @charlie.adult?
  end

  def test_it_cannot_be_an_adult
    refute @pam.adult?
  end
end