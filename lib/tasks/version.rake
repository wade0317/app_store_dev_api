# frozen_string_literal: true

require 'app_store_dev_api/version'
require 'semantic'

namespace :version do
  desc 'Print current version'
  task :current do
    puts AppStoreDevApi::VERSION
  end

  desc 'Increment version'
  task :increment do
    version = Semantic::Version.new(AppStoreDevApi::VERSION)
    path = File.expand_path(File.join('..', 'app_store_connect', 'version.rb'), __dir__)
    new_version = version.increment!(:minor).to_s

    File.open(path, 'r+') do |file|
      contents = file.read
      contents.gsub!(AppStoreDevApi::VERSION, new_version)

      file.rewind
      file.write(contents)

      new_version
    end
  end
end
