require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about_us" do
    it "returns http success" do
      get :about_us
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contacts" do
    it "returns http success" do
      get :contacts
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #faqs" do
    it "returns http success" do
      get :faqs
      expect(response).to have_http_status(:success)
    end
  end

end
