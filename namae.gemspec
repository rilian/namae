# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "namae"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sylvester Keil", "Dan Collis-Puro"]
  s.date = "2012-06-08"
  s.description = " Namae is a parser for human names. It recognizes personal names of various cultural backgrounds and tries to split them into their component parts (e.g., given and family names, honorifics etc.). "
  s.email = ["sylvester@keil.or.at", "dan@collispuro.com"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".autotest",
    ".document",
    ".rspec",
    ".simplecov",
    ".travis.yml",
    ".yardopts",
    "AGPL",
    "BSDL",
    "Gemfile",
    "README.md",
    "Rakefile",
    "cucumber.yml",
    "features/bibtex.feature",
    "features/examples.feature",
    "features/step_definitions/namae_steps.rb",
    "features/support/env.rb",
    "lib/namae.rb",
    "lib/namae/name.rb",
    "lib/namae/parser.rb",
    "lib/namae/parser.y",
    "lib/namae/utility.rb",
    "lib/namae/version.rb",
    "namae.gemspec",
    "spec/namae/name_spec.rb",
    "spec/namae/parser_spec.rb",
    "spec/namae/utility_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/berkmancenter/namae"
  s.licenses = ["AGPL"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Namae parses personal names and splits them into their component parts."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<racc>, ["~> 1.4.8"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<ZenTest>, ["~> 4.8.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
    else
      s.add_dependency(%q<racc>, ["~> 1.4.8"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<ZenTest>, ["~> 4.8.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    end
  else
    s.add_dependency(%q<racc>, ["~> 1.4.8"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<ZenTest>, ["~> 4.8.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
  end
end

