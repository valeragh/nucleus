require 'rails_helper'

RSpec.describe CabinetsController, type: :controller do
  login_user

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the faqs template" do
      get :show
      expect(response).to render_template("show")
      expect(response.body).to eq ""
    end
  end

end
