require 'rails_helper'

RSpec.describe Admin::PodCategoriesController, type: :controller do

  render_views
  let(:resource_class) { PodCategory }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the pod_category' do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      get :index
      expect(assigns(:pod_categories)).to include(pod_category)
    end
    it "should render the expected columns" do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      get :index
      expect(page).to have_content(pod_category.title)
      expect(page).to have_content(pod_category.rang)
      expect(page).to have_content(category.title)
    end
    let(:filters_sidebar) { page.find('#filters_sidebar_section') }
    it "filter Title exists" do
      get :index
      expect(filters_sidebar).to have_css('label[for="q_title"]', text: 'Заголовок')
      expect(filters_sidebar).to have_css('input[name="q[title_contains]"]')
    end
    it "filter Title works" do
      category = create(:category)
      matching_category = create(:pod_category, title: 'test', category_id: category.id)
      non_matching_category = create(:pod_category, title: 'non', category_id: category.id)

      get :index, q: { title_cont: 'test' }

      expect(assigns(:pod_categories)).to include(matching_category)
      expect(assigns(:pod_categories)).not_to include(non_matching_category)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the pod_category' do
      get :new
      expect(assigns(:pod_category)).to be_a_new(PodCategory)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Приоритет')
      expect(page).to have_field('Категория')
      expect(page).to have_field('Изображение для плитки')
    end
  end

  

  describe "GET edit" do
    it 'returns http success' do
      pod_category = create(:pod_category)
      get :edit, id: pod_category
      expect(response).to have_http_status(:success)
    end
    it 'assigns the pod_category' do
      pod_category = create(:pod_category)
      get :edit, id: pod_category
      expect(assigns(:pod_category)).to eq(pod_category)
    end
    it "should render the form elements" do
      pod_category = create(:pod_category)
      get :edit, id: pod_category
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Приоритет')
      expect(page).to have_field('Категория')
      expect(page).to have_field('Изображение для плитки')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the pod_category' do
        pod_category = create(:pod_category)
        @attr = { :title => 'test', :rang=>'1' }
        put :update, id: pod_category, :pod_category => @attr
        expect(assigns(:pod_category)).to eq(pod_category)
      end
      it 'returns http redirect' do
        pod_category = create(:pod_category)
        @attr = { :title => 'MyString', :rang=>'1' }
        put :update, id: pod_category, :pod_category => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_pod_category_path(pod_category))
      end
      it "should update the pod_category" do
        pod_category = create(:pod_category)
        @attr = { :title => 'test', :rang=>'1' }
        put :update, id: pod_category, :pod_category => @attr
        pod_category.reload
        expect(pod_category.title).to  eq(@attr[:title])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        pod_category = create(:pod_category)
        @attr = { :title => '', :rang=>'1' }
        put :update, id: pod_category, :pod_category => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change pod_category' do
        pod_category = create(:pod_category)
        @attr = { :title => '', :rang=>'1' }
        expect do
          put :update, id: pod_category, :pod_category => @attr
        end.not_to change { pod_category.reload.title }
      end
    end
  end

   describe "GET show" do
    it 'returns http success' do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      get :show, id: pod_category
      expect(response).to have_http_status(:success)
    end
    it 'assigns the pod_category' do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      get :show, id: pod_category
      expect(assigns(:pod_category)).to eq(pod_category)
    end
    it "should render the form elements" do
      category = create(:category)
      pod_category = create(:pod_category, category_id: category.id)
      get :show, id: pod_category
      expect(page).to have_content(pod_category.title)
      expect(page).to have_content(pod_category.rang)
      expect(page).to have_content(category.title)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      pod_category = create(:pod_category)
      expect {
        delete :destroy, id: pod_category
      }.to change(PodCategory, :count).by(-1)
    end

    it "redirects to the field" do
      pod_category = create(:pod_category)
      delete :destroy, id: pod_category
      expect(response).to redirect_to(admin_pod_categories_path)
    end
  end

  

end