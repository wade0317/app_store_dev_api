# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'app_store_dev_api/version'

Gem::Specification.new do |spec|
  spec.name = "app_store_dev_api"
  spec.version = AppStoreDevApi::VERSION
  spec.authors = ["wade"]
  spec.email = ["wade@gmail.com"]

  spec.summary = "easy work for app_store_dev_api work"
  spec.description = "easy work for app_store_dev_api"
  spec.homepage = "https://github.com/wade0317/app_store_dev_api.git."
  spec.license = "MIT"
  

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wade0317/app_store_dev_api.git.git"
  spec.metadata["changelog_uri"] = "https://github.com/wade0317/app_store_dev_api.git/blob/main/CHANGELOG.md"


  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7.0'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end


  spec.add_runtime_dependency 'activesupport', '~> 7.0'
  spec.add_runtime_dependency 'jwt', '~> 2.0', '>= 2.0.0'
  spec.add_runtime_dependency 'zeitwerk', '~> 2.6'

  spec.add_development_dependency 'bundler', '~> 2.4', '>= 2.4.0'
  spec.add_development_dependency 'erb', '~> 4.0.2'
  spec.add_development_dependency 'factory_bot', '~> 6.2.1'
  spec.add_development_dependency 'github_changelog_generator', '1.16.4'
  spec.add_development_dependency 'guard-rspec', '~> 4.7.3'
  spec.add_development_dependency 'pry', '~> 0.14.1'
  spec.add_development_dependency 'rake', '~> 13.0.6'
  spec.add_development_dependency 'rspec', '~> 3.12.0'
  spec.add_development_dependency 'rubocop', '~> 1.56.4'
  spec.add_development_dependency 'rubyzip', '~> 2.3'
  spec.add_development_dependency 'semantic', '~> 1.6.1'
  spec.add_development_dependency 'simplecov', '~> 0.22.0'
  spec.add_development_dependency 'timecop', '~> 0.9.8'
  spec.add_development_dependency 'webmock', '~> 3.18.1'

end
