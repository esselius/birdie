require 'bundler/setup'

require 'json'

require_relative 'lib/config'
require_relative 'lib/static_provider'

module App
  def name
    'birdie'
  end
end
