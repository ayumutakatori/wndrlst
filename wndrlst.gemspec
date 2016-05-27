# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wndrlst/version'

Gem::Specification.new do |spec|
  spec.name          = "wndrlst"
  spec.version       = Wndrlst::VERSION
  spec.authors       = ["katsumata_ryo"]
  spec.email         = ["ktmt.ryo@gmail.com"]

  spec.summary       = %q{[WIP]Wunderlist wrapper gem.}
  spec.description   = %q{[WIP]Wunderlist wrapper gem.}
  spec.homepage      = "https://github.com/katsumata-ryo/wndrlst"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
