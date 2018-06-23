require "spec_helper"

module Jobernetes
  describe Configuration do
    describe "#url" do
      it "default value is foo/bar/path" do
        Configuration.new.kube_config_path = "foo/bar/path"
      end
    end

    describe "#kube_config_path=" do
      it "can set value" do
        config = Configuration.new
        config.kube_config_path = "my/super/path"
        expect(config.kube_config_path).to eq("my/super/path")
      end
    end
  end
end
