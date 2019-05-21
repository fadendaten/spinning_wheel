module SpinningWheel
  def self.define(&block)
    DSL.run(block)
  end

  class DSL
    def self.run(block)
      new.instance_eval(&block)
    end

    def fabric(name:, class_name:, &block)
      fabric = SpinningWheel::Fabric.
        new(name: name, class_name: class_name, &block)
      SpinningWheel.register_fabric(fabric)
    end
  end
end
