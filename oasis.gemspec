
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "oasis/version"

Gem::Specification.new do |spec|
  spec.name          = "oasis"
  spec.version       = Oasis::VERSION
  spec.authors       = ["Filipe Abreu"]
  spec.email         = ["filipe.abreu@xing.com"]

  spec.summary       = "Both the snake and the camel meet at Oasis."
  spec.description   = "Middleware to translate request/response body attributes from camelCase to snake_case and vice-versa."
  spec.homepage      = "https://source.xing.com/filipe-abreu/oasis.git"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://source.xing.com/filipe-abreu/oasis.git"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
