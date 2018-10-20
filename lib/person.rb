class Person
  attr_reader :name, :age

  def initialize(info)
    @name = info['name']
    @age  = info['age']
  end

  def adult?
    age >= 18
  end
end