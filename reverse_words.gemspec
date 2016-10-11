# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reverse_words/version'

Gem::Specification.new do |spec|
  spec.name          = "reverse_words"
  spec.version       = ReverseWords::VERSION
  spec.authors       = ["Tim Schmelmer"]
  spec.email         = ["tim.schmelmer@gmail.com"]

  spec.summary       = %q{This adds revering the order of words in a string to Ruby's String class.}
  spec.description   = %q{Just an example for how to reverse the words in a sentence via `String#reverse_words`}
  spec.homepage      = "https://github.com/timbogit/reverse_words"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
