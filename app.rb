require 'bundler/setup'

require 'aws-sdk'
require 'json'

require_relative 'lib/config'
require_relative 'lib/static_provider'
require_relative 'lib/provisioner'

module App
  def name
    'birdie'
  end
end
