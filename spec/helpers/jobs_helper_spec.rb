require 'spec_helper'

describe JobsHelper do
  describe "#url_with_protocol" do
    it "appends the protocol when absent" do
      helper.url_with_protocol("www.google.com").should == "http://www.google.com"
    end

    it "does not append the protocol when present" do
      helper.url_with_protocol("http://www.google.com").should == "http://www.google.com"
    end
  end
end
