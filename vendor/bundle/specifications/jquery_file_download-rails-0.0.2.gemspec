# -*- encoding: utf-8 -*-
# stub: jquery_file_download-rails 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery_file_download-rails"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Richard Cook"]
  s.date = "2014-12-07"
  s.description = "jquery.fileDownload.js package for Rails 3.1+ asset pipeline"
  s.email = "rcook@rcook.org"
  s.homepage = "https://github.com/rcook/jquery_file_download-rails/"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "jquery_file_download-rails"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.0"])
  end
end
