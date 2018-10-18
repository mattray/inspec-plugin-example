# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "inspec-plugin-example/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec-plugin-example"
  spec.version       = Example::VERSION
  spec.authors       = ["Matt Ray"]
  spec.email         = ["matt@chef.io"]
  spec.summary       = "InSpec Plugin Example"
  spec.description   = "Example for implementing an InSpec plugin."
  spec.homepage      = "https://github.com/mattray/inspec-plugin-example"
  spec.license       = "Apache-2.0"

  spec.files = %w{
    README.md inspec-plugin-example.gemspec Gemfile
  } + Dir.glob(
    "{bin,docs,examples,lib,tasks,test}/**/*", File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }

  spec.require_paths = ["lib"]

  spec.add_dependency "inspec", ">2.3"
end
