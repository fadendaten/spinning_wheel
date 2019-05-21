require "bundler/setup"
require "spinning_wheel"


spec = Gem::Specification.find_by_name("spinning_wheel")
gem_root = spec.gem_dir

Dir[File.join(gem_root, "spec", "fixtures", "**/*.rb")].sort.each do |file|
  require file
end

RSpec.configure do |config|

  config.include SpinningWheel

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

end
