# frozen_string_literal: true

require 'appstore_dev_api/version'

desc "Build appstore_dev_api-#{AppStoreConnectApi::VERSION}.gem"
task :build do
  sh %(gem build appstore_dev_api.gemspec)
end
