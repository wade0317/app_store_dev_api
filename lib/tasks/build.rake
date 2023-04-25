# frozen_string_literal: true

require 'appstore_connect_api/version'

desc "Build appstore_connect_api-#{AppStoreConnectApi::VERSION}.gem"
task :build do
  sh %(gem build appstore_connect_api.gemspec)
end
