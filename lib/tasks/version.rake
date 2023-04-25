# frozen_string_literal: true

require 'appstore_dev_api/version'
require 'semantic'

namespace :version do
  desc 'Print current version'
  task :current do
    puts AppStoreConnectApi::VERSION
  end

  desc 'Increment version'
  task :increment do
    version = Semantic::Version.new(AppStoreConnectApi::VERSION)
    path = File.expand_path(File.join('..', 'app_store_connect', 'version.rb'), __dir__)
    new_version = version.increment!(:minor).to_s

    File.open(path, 'r+') do |file|
      contents = file.read
      contents.gsub!(AppStoreConnectApi::VERSION, new_version)

      file.rewind
      file.write(contents)

      new_version
    end
  end
end
