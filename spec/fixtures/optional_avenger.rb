class OptionalAvenger

  attr_reader :pre_name, :age, :options

  def initialize(pre_name:, age:, options:{})
    @pre_name = pre_name
    @age = age
    @options = options
  end

end
