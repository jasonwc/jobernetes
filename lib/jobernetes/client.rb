require 'kubeclient'

module Jobernetes
  class Client
    def new(api)
      kube_config = File.expand_path(Jobernetes.configuration.kube_config_path)
      config = Kubeclient::Config.read(kube_config)
      Kubeclient::Client.new(config.context.api_endpoint + api, 'v1', {
        ssl_options: config.context.ssl_options,
        auth_options: config.context.auth_options
      })
    end
  end
end
