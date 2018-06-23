# ActiveJob docs: http://edgeguides.rubyonrails.org/active_job_basics.html
# Example adapters ref: https://github.com/rails/rails/tree/master/activejob/lib/active_job/queue_adapters

require 'active_job'
require 'jobernetes/job'
require 'jobernetes/cron_job'

module ActiveJob
  module QueueAdapters
    # == Jobernetes adapter for Active Job
    #
    # Jobernetes lets you schedule jobs on your Kubernetes cluster
    #
    # To use Jobernetes set the queue_adapter config to +:jobernetes+.
    #
    #   Rails.application.config.active_job.queue_adapter = :jobernetes
    class JobernetesAdapter
      def enqueue(job)
        Jobernetes::Job.enqueue!(job)
      end

      def enqueue_at(job, timestamp)
        Jobernetes::CronJob.enqueue_at!(job, timestamp)
      end

      class JobWrapper
        def perform(job_data)
          Rails.logger.debug("I'm also in Jobernetes!")
        end
      end
    end
  end
end
