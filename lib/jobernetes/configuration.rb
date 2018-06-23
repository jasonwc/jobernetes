module Jobernetes
  class Configuration
    attr_accessor :kube_config_path

    def initialize
      @kube_config_path = 'foo/bar/path'
    end
  end
end
