module SpinningWheel
  class Fabric

    attr_reader :name, :class_name

    def initialize(name:, class_name:, &block)
      @name = name
      @class_name = class_name
      @block = block
    end

    def build
      @klass = @class_name.constantize
      attributes = DSL.run(@block)
      parameters = @klass.instance_method(:initialize).parameters
      required_parametes = []
      parameters.each do |parameter|
        if parameter[0] == :req
          required_parametes << parameter[1]
        end
      end
      if required_parametes == attributes.keys
        @klass.new(*attributes.values)
      else
        @klass.new(**attributes)
      end
    end


    class DSL

      attr_accessor :attributes

      def self.run(block)
        dsl = self.new
        dsl.instance_eval(&block)
        return dsl.attributes
      end

      def initialize()
        @attributes = Hash.new
        clean_up_object_methods()
      end

      def method_missing(name, *args, &block)
        @attributes[name] = block.call
      end

      private

      def clean_up_object_methods
        self.instance_eval('undef :clone')
        self.instance_eval('undef :display')
        self.instance_eval('undef :dup')
        self.instance_eval('undef :extend')
        self.instance_eval('undef :freeze')
        self.instance_eval('undef :frozen?')
        self.instance_eval('undef :inspect')
        self.instance_eval('undef :taint')
        self.instance_eval('undef :tap')
      end
    end

  end
end
