require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe StoresController, type: :controller do
  include CarrierWave::Test::Matchers

  describe "GET #category" do
    it "returns http success" do
      category = create(:category)
      get :category, id: category
      expect(response).to have_http_status(:success)
    end

    it "renders the #category view" do
      category = create(:category)
      get :category, id: category
      expect(response).to render_template :category
    end

    it "assigns the requested category to @category" do
      category = create(:category)
      get :category, id: category
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET #pod_category" do
    it "returns http success" do
      get :pod_category
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #product" do
    it "returns http success" do
      get :product
      expect(response).to have_http_status(:success)
    end
  end

end
