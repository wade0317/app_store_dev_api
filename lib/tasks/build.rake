# frozen_string_literal: true

require 'app_store_dev_api/version'

desc "Build app_store_dev_api-#{AppStoreDevApi::VERSION}.gem"
task :build do
  sh %(gem build app_store_dev_api.gemspec)
end
