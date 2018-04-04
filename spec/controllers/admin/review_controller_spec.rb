require 'rails_helper'

RSpec.describe Admin::ReviewsController, type: :controller do

  render_views
  let(:resource_class) { Review }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the review' do
      product = create(:product)
      review = create(:review, product_id: product.id)
      get :index
      expect(assigns(:reviews)).to include(review)
    end
    it "should render the expected columns" do
      product = create(:product)
      review = create(:review, product_id: product.id)
      get :index
      expect(page).to have_content(product.title)
      expect(page).to have_content(review.name)
      expect(page).to have_content(review.description)
      expect(page).to have_content(review.status)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the review' do
      get :new
      expect(assigns(:review)).to be_a_new(Review)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Имя')
      expect(page).to have_field('Товар')
      expect(page).to have_field('Отзыв')
      expect(page).to have_field('Статус')
    end
  end


  describe "GET edit" do
    it 'returns http success' do
      review = create(:review)
      get :edit, id: review
      expect(response).to have_http_status(:success)
    end
    it 'assigns the review' do
      review = create(:review)
      get :edit, id: review
      expect(assigns(:review)).to eq(review)
    end
    it "should render the form elements" do
      review = create(:review)
      get :edit, id: review
      expect(page).to have_field('Имя')
      expect(page).to have_field('Товар')
      expect(page).to have_field('Отзыв')
      expect(page).to have_field('Статус')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the review' do
        review = create(:review)
        @attr = { :name => 'test', :description=>'1' }
        put :update, id: review, :review => @attr
        expect(assigns(:review)).to eq(review)
      end
      it 'returns http redirect' do
        review = create(:review)
        @attr = { :name => 'test', :description=>'1' }
        put :update, id: review, :review => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_review_path(review))
      end
      it "should update the review" do
        review = create(:review)
        @attr = { :name => 'test', :description=>'1' }
        put :update, id: review, :review => @attr
        review.reload
        expect(review.name).to  eq(@attr[:name])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        review = create(:review)
        @attr = { :name => '', :description=>'1' }
        put :update, id: review, :review => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change review' do
        review = create(:review)
        @attr = { :name => '', :description=>'1' }
        expect do
          put :update, id: review, :review => @attr
        end.not_to change { review.reload.name }
      end
    end
  end

   describe "GET show" do
    it 'returns http success' do
      product = create(:product)
      review = create(:review, product_id: product.id)
      get :show, id: review
      expect(response).to have_http_status(:success)
    end
    it 'assigns the review' do
      product = create(:product)
      review = create(:review, product_id: product.id)
      get :show, id: review
      expect(assigns(:review)).to eq(review)
    end
    it "should render the form elements" do
      product = create(:product)
      review = create(:review, product_id: product.id)
      get :show, id: review
      expect(page).to have_content(product.title)
      expect(page).to have_content(review.name)
      expect(page).to have_content(review.description)
      expect(page).to have_content(review.status)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      review = create(:review)
      expect {
        delete :destroy, id: review
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the field" do
      review = create(:review)
      delete :destroy, id: review
      expect(response).to redirect_to(admin_reviews_path)
    end
  end

  

end