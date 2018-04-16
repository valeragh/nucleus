require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      cart = create(:cart)
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      cart = create(:cart)
      get :show
      expect(response).to render_template("show")
    end
  end

end
