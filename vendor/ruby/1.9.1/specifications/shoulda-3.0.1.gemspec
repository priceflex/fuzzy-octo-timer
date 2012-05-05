# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "shoulda"
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tammer Saleh", "Joe Ferris", "Ryan McGeary", "Dan Croak", "Matt Jankowski"]
  s.date = "2012-02-29"
  s.description = "Making tests easy on the fingers and eyes"
  s.email = "support@thoughtbot.com"
  s.homepage = "https://github.com/thoughtbot/shoulda"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.21"
  s.summary = "Making tests easy on the fingers and eyes"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<shoulda-context>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<shoulda-matchers>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rails>, ["= 3.0.3"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.2"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.3.1"])
      s.add_development_dependency(%q<cucumber>, ["~> 0.10.0"])
      s.add_development_dependency(%q<aruba>, ["~> 0.2.7"])
    else
      s.add_dependency(%q<shoulda-context>, ["~> 1.0.0"])
      s.add_dependency(%q<shoulda-matchers>, ["~> 1.0.0"])
      s.add_dependency(%q<rails>, ["= 3.0.3"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.2"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.3.1"])
      s.add_dependency(%q<cucumber>, ["~> 0.10.0"])
      s.add_dependency(%q<aruba>, ["~> 0.2.7"])
    end
  else
    s.add_dependency(%q<shoulda-context>, ["~> 1.0.0"])
    s.add_dependency(%q<shoulda-matchers>, ["~> 1.0.0"])
    s.add_dependency(%q<rails>, ["= 3.0.3"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.2"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.3.1"])
    s.add_dependency(%q<cucumber>, ["~> 0.10.0"])
    s.add_dependency(%q<aruba>, ["~> 0.2.7"])
  end
end
