# -*- encoding: utf-8 -*-
# stub: seb_view_tool 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "seb_view_tool"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sebastian Valdez"]
  s.bindir = "exe"
  s.date = "2017-07-26"
  s.description = "Provides generated HTML, data for Rails "
  s.email = ["valdez.sebastian4@gmail.com"]
  s.homepage = "https://sebastian-valdez.com"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "View specific methods for an application I use."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.14"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.14"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.14"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
  end
end
