# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "string_utility_belt/version"

Gem::Specification.new do |s|
  s.name        = "string_utility_belt"
  s.version     = StringUtilityBelt::VERSION
  s.authors     = ["Rodrigo Serradura"]
  s.email       = ["rserradura@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Useful methods to handle strings}
  s.description = %q{Adds new features for String objects.}

  s.rubyforge_project = "string_utility_belt"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("htmlentities", "4.3.0")
end
