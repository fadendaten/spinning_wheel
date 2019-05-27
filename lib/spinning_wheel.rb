require 'active_support/inflector'

spec = Gem::Specification.find_by_name("spinning_wheel")
gem_root = spec.gem_dir

Dir[File.join(gem_root, "lib", "spinning_wheel", "**/*.rb")].sort.each do |file|
  require file
end

module SpinningWheel

  @fabrics = Hash.new

  def self.create(name)
    @fabrics[name].build
  end

  def self.register_fabric(fabric)
    @fabrics[fabric.name] = fabric
  end
end
