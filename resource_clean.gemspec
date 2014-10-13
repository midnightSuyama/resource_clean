# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resource_clean/version'

Gem::Specification.new do |spec|
  spec.name          = "resource_clean"
  spec.version       = ResourceClean::VERSION
  spec.authors       = ["midnightSuyama"]
  spec.email         = ["midnightSuyama@gmail.com"]
  spec.summary       = "Delete resource file and xattr"
  spec.description   = "Delete resource file and xattr"
  spec.homepage      = "https://github.com/midnightSuyama/resource_clean"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"

  spec.add_runtime_dependency "ffi-xattr"
end
