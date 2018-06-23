require "spec_helper"

describe Jobernetes do
  it "has a version number" do
    expect(Jobernetes::VERSION).not_to be nil
  end

  describe "#configure" do
    before do
      Jobernetes.configure do |config|
        config.kube_config_path = 'my/cool/path'
      end
    end

    it "returns an array with 10 elements" do
      config = Jobernetes.configuration

      expect(config.kube_config_path).to eq('my/cool/path')
    end

    after :each do
      Jobernetes.reset
    end
  end

  describe ".reset" do
    before :each do
      Jobernetes.configure do |config|
        config.kube_config_path = 'my/cool/path'
      end
    end

    it "resets the configuration" do
      Jobernetes.reset

      config = Jobernetes.configuration

      expect(config.kube_config_path).to eq('foo/bar/path')
    end
  end
end
