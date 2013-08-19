require 'spec_helper'

describe QuotersController do

  describe "unauthenticated user" do
    let(:quoter) do
      FactoryGirl.create(:quoter)
    end

    [:new, :edit, :update, :destroy].each do |action|
      it "#{action} should redirect to sign in page" do
        get action if action == :new
        get action, :id => quoter.id if action == :edit
        patch action, :id => quoter.id, :quoter => FactoryGirl.attributes_for(:quoter) if action == :update
        delete action, :id => quoter.id if action == :destroy
        response.should redirect_to(new_user_session_path)
      end
    end
  end
  
  describe "authenticated user" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end

    describe "renders template" do
      [:index, :new, :edit].each do |template|
        it template do
          params = nil
          if template == :edit
            quoter = FactoryGirl.create(:quoter)
            params = {:id => quoter.id}
          end
          get template, params
          expect(response).to render_template(template)
        end
      end
    end

    describe "index action" do
      it "should load all quoters" do
        quoter1, quoter2 = FactoryGirl.create(:quoter), FactoryGirl.create(:quoter)
        get :index
        expect(assigns(:quoters)).to match_array([quoter1, quoter2])
      end
    end

    describe "create action" do
      it "should create quoter if validations passed" do
        post :create, :quoter => FactoryGirl.attributes_for(:quoter)
        response.should redirect_to(:action => :index)
      end
    
      it "should render 'new' view if validations failed" do
        quoter_attributes = FactoryGirl.attributes_for(:quoter)
        quoter_attributes[:name] = nil
        post :create, :quoter => quoter_attributes
        expect(response).to render_template(:new)
      end
    end

    describe "edit action" do
      it "should load quoter" do
        quoter = FactoryGirl.create(:quoter)
        get :edit, :id => quoter.id
        expect(assigns(:quoter)).to eq(quoter)
      end
    end

    describe "update action" do
      it "should update quoter attributes if validations passed" do
        new_value = "http://new.example.com"
        quoter = FactoryGirl.create(:quoter)
        quoter_attributes = FactoryGirl.attributes_for(:quoter)
        quoter_attributes[:name] = new_value
        quoter_attributes[:rss_url] = new_value
        patch :update, :id => quoter.id, :quoter => quoter_attributes
        quoter.reload
        quoter.name.should eq(new_value)
        quoter.rss_url.should eq(new_value)
      end
    end

    describe "destroy action" do
      it "should destroy quoter" do
        quoter = FactoryGirl.create(:quoter)
        delete :destroy, :id => quoter.id
        Quoter.count.should be(0)
      end
    end
  end
end
