require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      product = create(:product)
      get :index, :product_id => product.id
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      product = create(:product)
      get :index, :product_id => product.id
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "returns http success" do
      product = create(:product)
      review = create(:review, :product_id => product.id)
      get :show, :product_id => product.id, :id => review.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      product = create(:product)
      get :new, :product_id => product.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new review" do
        product = create(:product)
        expect{
          post :create, :product_id => product.id, review: FactoryGirl.attributes_for(:review)
        }.to change(Review,:count).by(1)
      end
      
      it "redirects to the new review" do
        product = create(:product)
        post :create, :product_id => product.id, review: FactoryGirl.attributes_for(:review)
        expect(response).to redirect_to root_url
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new review" do
        product = create(:product)
        expect{
          post :create, :product_id => product.id, review: FactoryGirl.attributes_for(:invalid_review)
        }.to_not change(Review, :count)
      end
      
      it "re-renders the new method" do
        product = create(:product)
        post :create, :product_id => product.id, review: FactoryGirl.attributes_for(:invalid_review)
        expect(response).to render_template :new
      end
    end 
  end

end
