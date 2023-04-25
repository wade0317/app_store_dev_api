# frozen_string_literal: true

require 'zeitwerk'
require 'active_support/all'

appstore_connect_api_LOADER = Zeitwerk::Loader.for_gem
appstore_connect_api_LOADER.setup

module AppStoreConnectApi
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
