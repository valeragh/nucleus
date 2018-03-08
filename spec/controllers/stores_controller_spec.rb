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
      category = create(:category)
      pod_category = create(:pod_category)
      get :pod_category, category_id: category, id: pod_category
      expect(response).to have_http_status(:success)
    end

    it "renders the #pod_category view" do
      category = create(:category)
      pod_category = create(:pod_category)
      get :pod_category, category_id: category, id: pod_category
      expect(response).to render_template :pod_category
    end

    it "assigns the requested pod_category to @pod_category" do
      category = create(:category)
      pod_category = create(:pod_category)
      get :pod_category, category_id: category, id: pod_category
      expect(assigns(:pod_category)).to eq(pod_category)
    end
  end

  describe "GET #product" do
    it "returns http success" do
      category = create(:category)
      pod_category = create(:pod_category)
      product = create(:product, pod_category_id: pod_category.id)
      get :product, category_id: category, pod_category_id: pod_category, id: product
      expect(response).to have_http_status(:success)
    end

    it "renders the #product view" do
      category = create(:category)
      pod_category = create(:pod_category)
      product = create(:product, pod_category_id: pod_category.id)
      get :product, category_id: category, pod_category_id: pod_category, id: product
      expect(response).to render_template :product
    end

    it "assigns the requested product to @product" do
      category = create(:category)
      pod_category = create(:pod_category)
      product = create(:product, pod_category_id: pod_category.id)
      get :product, category_id: category, pod_category_id: pod_category, id: product
      expect(assigns(:product)).to eq(product)
    end
  end

end
