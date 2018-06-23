require "jobernetes/version"
require "jobernetes/configuration"
require "jobernetes/job"
require "jobernetes/cron_job"

module Jobernetes
  # This hook happens after `Rails::Application` is inherited within
  # config/application.rb and before config is touched, usually within the
  # class block. Definitely before config/environments/*.rb and
  # config/initializers/*.rb
  if defined?(::ActiveJob)
    require 'jobernetes/extensions/active_job_adapter'
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
