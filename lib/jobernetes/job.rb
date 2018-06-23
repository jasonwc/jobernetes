require 'kubeclient'
require 'pry'

module Jobernetes
  module Job
    class << self
      attr_accessor :client
    end

    def self.client
      @client ||= build_client
    end

    def self.build_client
      kube_config = File.expand_path(Jobernetes.configuration.kube_config_path)
      config = Kubeclient::Config.read(kube_config)
      Kubeclient::Client.new(config.context.api_endpoint + "/apis/batch", 'v1', {
        ssl_options: config.context.ssl_options,
        auth_options: config.context.auth_options
      })
    end

    def self.enqueue!(job)
      manifest = job.class.manifest

      job_object = Kubeclient::Resource.new(manifest)
      client.create_job(job_object)
    end
  end
end
