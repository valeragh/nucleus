require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do

  render_views
  let(:resource_class) { Category }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the category' do
      category = create(:category)
      get :index
      expect(assigns(:categories)).to include(category)
    end
    it "should render the expected columns" do
      category = create(:category)
      get :index
      expect(page).to have_content(category.title)
      expect(page).to have_content(category.rang)
    end
    let(:filters_sidebar) { page.find('#filters_sidebar_section') }
    it "filter Title exists" do
      get :index
      expect(filters_sidebar).to have_css('label[for="q_title"]', text: 'Заголовок')
      expect(filters_sidebar).to have_css('input[name="q[title_contains]"]')
    end
    it "filter Title works" do
      matching_category = create(:category, title: 'test')
      non_matching_category = create(:category, title: 'non')

      get :index, q: { title_cont: 'test' }

      expect(assigns(:categories)).to include(matching_category)
      expect(assigns(:categories)).not_to include(non_matching_category)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Приоритет')
      expect(page).to have_field('Изображение для плитки')
    end
  end

  

  describe "GET edit" do
    it 'returns http success' do
      category = create(:category)
      get :edit, id: category
      expect(response).to have_http_status(:success)
    end
    it 'assigns the category' do
      category = create(:category)
      get :edit, id: category
      expect(assigns(:category)).to eq(category)
    end
    it "should render the form elements" do
      category = create(:category)
      get :edit, id: category
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Приоритет')
      expect(page).to have_field('Изображение для плитки')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the category' do
        category = create(:category)
        @attr = { :title => 'test', :rang=>'1' }
        put :update, id: category, :category => @attr
        expect(assigns(:category)).to eq(category)
      end
      it 'returns http redirect' do
        category = create(:category)
        @attr = { :title => 'MyString', :rang=>'1' }
        put :update, id: category, :category => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_category_path(category))
      end
      it "should update the category" do
        category = create(:category)
        @attr = { :title => 'test', :rang=>'1' }
        put :update, id: category, :category => @attr
        category.reload
        expect(category.title).to  eq(@attr[:title])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        category = create(:category)
        @attr = { :title => '', :rang=>'1' }
        put :update, id: category, :category => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change category' do
        category = create(:category)
        @attr = { :title => '', :rang=>'1' }
        expect do
          put :update, id: category, :category => @attr
        end.not_to change { category.reload.title }
      end
    end
  end

   describe "GET show" do
    it 'returns http success' do
      category = create(:category)
      get :show, id: category
      expect(response).to have_http_status(:success)
    end
    it 'assigns the category' do
      category = create(:category)
      get :show, id: category
      expect(assigns(:category)).to eq(category)
    end
    it "should render the form elements" do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      get :show, id: category
      expect(page).to have_content(category.title)
      expect(page).to have_content(category.rang)
      expect(page).to have_content(pod_category.title)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      category = create(:category)
      expect {
        delete :destroy, id: category
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the field" do
      category = create(:category)
      delete :destroy, id: category
      expect(response).to redirect_to(admin_categories_path)
    end
  end

  

end