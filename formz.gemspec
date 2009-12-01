# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{formz}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Holowaychuk"]
  s.date = %q{2009-12-01}
  s.description = %q{Framework independant tag helpers}
  s.email = %q{tj@vision-media.ca}
  s.extra_rdoc_files = ["README.rdoc", "lib/formz.rb", "lib/formz/autoencoding.rb", "lib/formz/descriptions.rb", "lib/formz/errors.rb", "lib/formz/fauxmethod.rb", "lib/formz/helpers.rb", "lib/formz/import.rb", "lib/formz/labels.rb", "lib/formz/models.rb", "lib/formz/version.rb", "lib/formz/wrappers.rb", "lib/tagz.rb", "lib/tagz/helpers.rb", "lib/tagz/import.rb", "lib/tagz/tagz.rb", "lib/tagz/version.rb"]
  s.files = ["History.rdoc", "Manifest", "README.rdoc", "Rakefile", "benchmarks/small.rb", "examples/model.rb", "examples/small.rb", "formz.gemspec", "lib/formz.rb", "lib/formz/autoencoding.rb", "lib/formz/descriptions.rb", "lib/formz/errors.rb", "lib/formz/fauxmethod.rb", "lib/formz/helpers.rb", "lib/formz/import.rb", "lib/formz/labels.rb", "lib/formz/models.rb", "lib/formz/version.rb", "lib/formz/wrappers.rb", "lib/tagz.rb", "lib/tagz/helpers.rb", "lib/tagz/import.rb", "lib/tagz/tagz.rb", "lib/tagz/version.rb", "spec/autoencoding_spec.rb", "spec/descriptions_spec.rb", "spec/errors_spec.rb", "spec/factories/user.rb", "spec/fauxmethod_spec.rb", "spec/helpers_spec.rb", "spec/labels_spec.rb", "spec/models_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/tagz_helpers_spec.rb", "spec/tagz_spec.rb", "spec/wrappers_spec.rb"]
  s.homepage = %q{http://github.com/visionmedia/formz}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Formz", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{formz}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Framework independant tag helpers}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rext>, [">= 0.5.0"])
      s.add_development_dependency(%q<rspec_hpricot_matchers>, [">= 1.0.0"])
      s.add_development_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
    else
      s.add_dependency(%q<rext>, [">= 0.5.0"])
      s.add_dependency(%q<rspec_hpricot_matchers>, [">= 1.0.0"])
      s.add_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
    end
  else
    s.add_dependency(%q<rext>, [">= 0.5.0"])
    s.add_dependency(%q<rspec_hpricot_matchers>, [">= 1.0.0"])
    s.add_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
  end
end
