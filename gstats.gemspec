# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gstats}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacob Stetser"]
  s.date = %q{2009-01-22}
  s.description = %q{Helper for Google Analytics!}
  s.email = %q{jake@wideopenspac.es}
  s.files = ["VERSION.yml", "lib/google_stats_helper.rb", "lib/gstats.rb", "test/gstats_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/wideopenspaces/gstats}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Helper for Google Analytics!}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
