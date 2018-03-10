require 'rails_helper'

RSpec.describe LettersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new letter" do
        expect{
          post :create, letter: FactoryGirl.attributes_for(:letter)
        }.to change(Letter,:count).by(1)
      end
      
      it "redirects to the new letter" do
        post :create, letter: FactoryGirl.attributes_for(:letter)
        expect(response).to redirect_to root_url
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new letter" do
        expect{
          post :create, letter: FactoryGirl.attributes_for(:invalid_letter)
        }.to_not change(Letter, :count)
      end
      
      it "re-renders the new method" do
        post :create, letter: FactoryGirl.attributes_for(:invalid_letter)
        expect(response).to render_template :new
      end
    end 
  end

end
