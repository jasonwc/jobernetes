require 'kubeclient'
require 'jobernetes/client'

module Jobernetes
  module Job
    class << self
      attr_accessor :client
    end

    def self.client
      @client ||= Jobernetes::Client.new('/apis/batch')
    end

    def self.enqueue!(job)
      manifest = job.class.manifest

      job_object = Kubeclient::Resource.new(manifest)
      client.create_job(job_object)
    end
  end
end
