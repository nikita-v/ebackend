require 'spec_helper'

describe Quote do
  describe "testing validations" do
    let(:quote) do
      FactoryGirl.build :quote
    end
    
    [:quoter_id, :title, :body, :publicated_at].each do |field|
      it "shouldn't save without #{field}" do
        quote[field] = nil
        quote.save.should be_false
      end
    end
  end
end
