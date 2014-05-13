# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'priority_queue/version'

Gem::Specification.new do |spec|
  spec.name          = "priority_queue"
  spec.version       = PriorityQueue::VERSION
  spec.authors       = ["Brian Schröder", "Luc Donnet"]
  spec.email         = ["priority_queue@brian-schroeder.de", "luc.donnet@free.fr"]
  spec.summary       = %q{Ruby fibonacci-heap priority-queue implementation}
  spec.description   = %q{Ruby Fibonacci-heap priority-queue implementation}
  spec.homepage      = "https://github.com/ldonnet/priority-queue"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "ext"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
