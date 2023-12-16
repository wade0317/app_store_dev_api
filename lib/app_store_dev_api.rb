# frozen_string_literal: true

require 'zeitwerk'
require 'active_support/all'

app_store_dev_api_LOADER = Zeitwerk::Loader.for_gem
app_store_dev_api_LOADER.setup

module AppStoreDevApi
  @config = {}

  class << self
    attr_accessor :config

    def rel(id, type, array: false)
      if array
        { data: [{ id: id, type: type }] }.freeze
      else
        { data: { id: id, type: type } }.freeze
      end
    end
  end
end
