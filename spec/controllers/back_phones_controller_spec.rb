require 'rails_helper'

RSpec.describe BackPhonesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new back_phone" do
        expect{
          post :create, back_phone: FactoryGirl.attributes_for(:back_phone)
        }.to change(BackPhone,:count).by(1)
      end
      
      it "redirects to the new back_phone" do
        post :create, back_phone: FactoryGirl.attributes_for(:back_phone)
        expect(response).to redirect_to root_url
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new back_phone" do
        expect{
          post :create, back_phone: FactoryGirl.attributes_for(:invalid_letter)
        }.to_not change(BackPhone, :count)
      end
      
      it "re-renders the new method" do
        post :create, back_phone: FactoryGirl.attributes_for(:invalid_letter)
        expect(response).to render_template :new
      end
    end 
  end

end

