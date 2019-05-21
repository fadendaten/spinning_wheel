module SpinningWheel
  class Fabric

    attr_reader :name, :class_name

    def initialize(name:, class_name:, &block)
      @name = name
      @class_name = class_name
      @attributes = {}
      @block = block
    end

    def build
      @klass = @class_name.constantize
      instance_eval(&@block)
      parameters = @klass.instance_method(:initialize).parameters
      required_parametes = []
      parameters.each do |parameter|
        if parameter[0] == :req
          required_parametes << parameter[1]
        end
      end
      if required_parametes == @attributes.keys
        @klass.new(*@attributes.values)
      else
        @klass.new(**@attributes)
      end
    end

    def method_missing(name, *args, &block)
      @attributes[name] = block.call
    end

  end
end
