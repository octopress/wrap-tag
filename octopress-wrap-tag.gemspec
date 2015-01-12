# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-wrap-tag/version'

Gem::Specification.new do |spec|
  spec.name          = "octopress-wrap-tag"
  spec.version       = Octopress::Tags::Wrap::VERSION
  spec.authors       = ["Brandon Mathis"]
  spec.email         = ["brandon@imathis.com"]
  spec.summary       = %q{A Liquid block tag which makes it easy to wrap an include, render or yield tag with html}
  spec.description   = %q{A Liquid block tag which makes it easy to wrap an include, render or yield tag with html}
  spec.homepage      = "https://github.com/octopress/wrap-tag"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "octopress-tag-helpers", "~> 1.0"
  spec.add_runtime_dependency "octopress-include-tag", "~> 1.0"
  spec.add_runtime_dependency "octopress-render-tag", "~> 1.0"
  spec.add_runtime_dependency "octopress-content-for", "~> 1.0"
  spec.add_runtime_dependency "jekyll", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "clash"
  spec.add_development_dependency "octopress-ink"
  spec.add_development_dependency "octopress"
end
