require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	describe "administrator access" do
    login_admin

	  describe "GET #index" do
	    it "returns http success" do
	      get :index
	      expect(response).to have_http_status(:success)
	    end

	    it "renders the index template" do
	      get :index
	      expect(response).to render_template("index")
	      expect(response.body).to eq ""
	    end
	  end
  end

	describe 'guest access' do
	  describe 'GET #index' do
			it 'renders the :login' do
				get :index
				expect(response).to redirect_to new_user_session_url
			end
		end
	end

end
