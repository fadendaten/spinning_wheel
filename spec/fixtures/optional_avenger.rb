class OptionalAvenger

  attr_reader :name, :display, :age, :options

  def initialize(name:, age:, display: ,options:{})
    @name = name
    @age = age
    @display = display
    @options = options
  end

end
