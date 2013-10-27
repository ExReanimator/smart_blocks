# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smart_blocks/version'

Gem::Specification.new do |spec|
  spec.name          = "smart_blocks"
  spec.version       = SmartBlocks::VERSION
  spec.authors       = ["Ivan Teplyakov"]
  spec.email         = ["exreanimator@gmail.com"]
  spec.description   = %q{Useful concept for views, css and js organization}
  spec.summary       = %q{Useful concept for views, css and js organization}
  spec.homepage      = "https://github.com/ExReanimator/smart_blocks"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
