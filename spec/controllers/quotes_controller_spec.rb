require 'spec_helper'

describe QuotesController do

  describe "renders template" do
    it "index" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "index action" do
    before(:each) do
      @quote1, @quote2 = FactoryGirl.create(:quote), FactoryGirl.create(:quote)
    end
    
    it "should load all quotes" do
      get :index
      expect(assigns(:quotes)).to match_array([@quote1, @quote2])
    end
    
    it "should load all quotes from selected quoter" do
      @quote2.quoter_id = @quote1.quoter_id + 1
      @quote2.save
      @quote2.reload
      get :index, :quoter_id => @quote1.quoter_id
      expect(assigns(:quotes)).to match_array([@quote1])
    end
  end
end
