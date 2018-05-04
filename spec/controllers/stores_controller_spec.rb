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

    it "assigns the requested category to @category, pod_categories to @pod_categories" do
      category = create(:category)
      pod_categories = [create(:pod_category, category_id: category.id)]
      get :category, id: category
      expect(assigns(:category)).to eq(category)
      expect(assigns(:pod_categories)).to eq(pod_categories)
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

    it "assigns the requested pod_category to @pod_category, products to @products" do
      category = create(:category)
      pod_category = create(:pod_category)
      products = [create(:product, pod_category_id: pod_category.id)]
      get :pod_category, category_id: category, id: pod_category
      expect(assigns(:pod_category)).to eq(pod_category)
      expect(assigns(:products)).to eq(products)
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

    it "assigns the requested product to @product, products to @products" do
      category = create(:category)
      pod_category = create(:pod_category)
      product = create(:product, pod_category_id: pod_category.id)
      products = [create(:product, pod_category_id: pod_category.id)]
      get :product, category_id: category, pod_category_id: pod_category, id: product
      expect(assigns(:product)).to eq(product)
      expect(assigns(:products)).to eq(products)
    end
  end

  describe "GET #search" do
    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end

    it "renders the search template" do
      get :search
      expect(response).to render_template("search")
      expect(response.body).to eq ""
    end

    it "show search @products" do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      matching_product = create(:product, title: 'test', pod_category_id: pod_category.id, category_id: category.id)
      non_matching_product = create(:product, title: 'non', pod_category_id: pod_category.id, category_id: category.id)
      get :search, q: { title_or_description_cont: 'test' }

      expect(assigns(:products)).to include(matching_product)
      expect(assigns(:products)).not_to include(non_matching_product)
    end
  end

end
