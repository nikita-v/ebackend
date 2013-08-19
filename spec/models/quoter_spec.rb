require 'spec_helper'

describe Quoter do
  describe "testing validations" do
    let(:quoter) do
      FactoryGirl.build :quoter
    end
    
    [:name, :rss_url].each do |field|
      it "shouldn't save without #{field}" do
        quoter[field] = nil
        quoter.save.should be_false
      end
    end

    it "shouldn't save quoter with incorrect rss_url" do
      quoter.rss_url = "incorrect_url"
      quoter.save.should be_false
    end
  end
end
