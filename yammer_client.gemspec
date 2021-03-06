# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yammer_client/version'

Gem::Specification.new do |spec|
  spec.name          = "yammer_client"
  spec.version       = YammerClient::VERSION
  spec.authors       = ["Akira Osada"]
  spec.email         = ["osd.akira@gmail.com"]
  spec.summary       = %q{yammer client class on faraday}
  spec.description   = %q{yammer client class on faraday}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
