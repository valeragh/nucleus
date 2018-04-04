require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  render_views
  let(:resource_class) { Product }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the product' do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      product = create(:product, category_id: category.id, pod_category_id: pod_category.id)
      get :index
      expect(assigns(:products)).to include(product)
    end
    it "should render the expected columns" do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      product = create(:product, category_id: category.id, pod_category_id: pod_category.id)
      get :index
      expect(page).to have_content(category.title)
      expect(page).to have_content(pod_category.rang)
      expect(page).to have_content(product.title)
      expect(page).to have_content(product.price)
      expect(page).to have_content(product.rang)
    end
    let(:filters_sidebar) { page.find('#filters_sidebar_section') }
    it "filter Title exists" do
      get :index
      expect(filters_sidebar).to have_css('label[for="q_title"]', text: 'Заголовок')
      expect(filters_sidebar).to have_css('input[name="q[title_contains]"]')
    end
    it "filter Title works" do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      matching_category = create(:product, title: 'test', pod_category_id: pod_category.id, category_id: category.id)
      non_matching_category = create(:product, title: 'non', pod_category_id: pod_category.id, category_id: category.id)

      get :index, q: { title_cont: 'test' }

      expect(assigns(:products)).to include(matching_category)
      expect(assigns(:products)).not_to include(non_matching_category)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the product' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Приоритет')
      expect(page).to have_field('Подкатегория')
      expect(page).to have_field('Стоимость')
      expect(page).to have_field('Статус')
      expect(page).to have_field('Изображение для плитки')
    end
  end

  

  describe "GET edit" do
    it 'returns http success' do
      product = create(:product)
      get :edit, id: product
      expect(response).to have_http_status(:success)
    end
    it 'assigns the product' do
      product = create(:product)
      get :edit, id: product
      expect(assigns(:product)).to eq(product)
    end
    it "should render the form elements" do
      product = create(:product)
      get :edit, id: product
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Приоритет')
      expect(page).to have_field('Подкатегория')
      expect(page).to have_field('Стоимость')
      expect(page).to have_field('Статус')
      expect(page).to have_field('Изображение для плитки')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the product' do
        product = create(:product)
        @attr = { :title => 'test', :rang=>'1' }
        put :update, id: product, :product => @attr
        expect(assigns(:product)).to eq(product)
      end
      it 'returns http redirect' do
        product = create(:product)
        @attr = { :title => 'MyString', :rang=>'1' }
        put :update, id: product, :product => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_product_path(product))
      end
      it "should update the product" do
        product = create(:product)
        @attr = { :title => 'test', :rang=>'1' }
        put :update, id: product, :product => @attr
        product.reload
        expect(product.title).to  eq(@attr[:title])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        product = create(:product)
        @attr = { :title => '', :rang=>'1' }
        put :update, id: product, :product => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change product' do
        product = create(:product)
        @attr = { :title => '', :rang=>'1' }
        expect do
          put :update, id: product, :product => @attr
        end.not_to change { product.reload.title }
      end
    end
  end

   describe "GET show" do
    it 'returns http success' do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      product = create(:product, category_id: category.id, pod_category_id: pod_category.id)
      review = create(:review, product_id: product.id)
      get :show, id: product
      expect(response).to have_http_status(:success)
    end
    it 'assigns the product' do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      product = create(:product, category_id: category.id, pod_category_id: pod_category.id)
      review = create(:review, product_id: product.id)
      get :show, id: product
      expect(assigns(:product)).to eq(product)
    end
    it "should render the form elements" do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      product = create(:product, category_id: category.id, pod_category_id: pod_category.id)
      get :show, id: product
      expect(page).to have_content(category.title)
      expect(page).to have_content(pod_category.rang)
      expect(page).to have_content(product.title)
      expect(page).to have_content(product.price)
      expect(page).to have_content(product.rang)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      product = create(:product)
      expect {
        delete :destroy, id: product
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the field" do
      product = create(:product)
      delete :destroy, id: product
      expect(response).to redirect_to(admin_products_path)
    end
  end

  

end