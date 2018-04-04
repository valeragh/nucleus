require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  render_views
  let(:resource_class) { User }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the user' do
      user = create(:user)
      get :index
      expect(assigns(:users)).to include(user)
    end
    it "should render the expected columns" do
      user = create(:user)
      get :index
      expect(page).to have_content(user.email)
    end
    let(:filters_sidebar) { page.find('#filters_sidebar_section') }
    it "filter Email exists" do
      get :index
      expect(filters_sidebar).to have_css('label[for="q_email"]', text: 'Email')
      expect(filters_sidebar).to have_css('input[name="q[email_contains]"]')
    end
    it "filter Email works" do
      matching_user = create(:user, email: 'test@exp.com')
      non_matching_user = create(:user, email: 'non@non.com')

      get :index, q: { email_cont: 'test' }

      expect(assigns(:users)).to include(matching_user)
      expect(assigns(:users)).not_to include(non_matching_user)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Email')
    end
  end

  

  describe "GET edit" do
    it 'returns http success' do
      user = create(:user)
      get :edit, id: user
      expect(response).to have_http_status(:success)
    end
    it 'assigns the user' do
      user = create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq(user)
    end
    it "should render the form elements" do
      user = create(:user)
      get :edit, id: user
      expect(page).to have_field("Email", :type => "email")
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the user' do
        user = create(:user)
        @attr = { :email => Faker::Internet.email, :password=>'password', :password_confirmation=>'password' }
        put :update, id: user, :user => @attr
        expect(assigns(:user)).to eq(user)
      end
      it 'returns http redirect' do
        user = create(:user)
        @attr = { :email => Faker::Internet.email, :password=>'password', :password_confirmation=>'password' }
        put :update, id: user, :user => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_user_path(user))
      end
      it "should update the user" do
        user = create(:user)
        @attr = { :email => Faker::Internet.email, :password=>'password', :password_confirmation=>'password' }
        put :update, id: user, :user => @attr
        user.reload
        expect(user.email).to  eq(@attr[:email])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        user = create(:user)
        @attr = { :email => '', :password=>'password', :password_confirmation=>'password' }
        put :update, id: user, :user => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change user' do
        user = create(:user)
        @attr = { :email => '', :password=>'password', :password_confirmation=>'password' }
        expect do
          put :update, id: user, :user => @attr
        end.not_to change { user.reload.email }
      end
    end
  end

   describe "GET show" do
    it 'returns http success' do
      user = create(:user)
      get :show, id: user
      expect(response).to have_http_status(:success)
    end
    it 'assigns the user' do
      user = create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq(user)
    end
    it "should render the form elements" do
      user = create(:user)
      get :show, id: user
      expect(page).to have_content(user.email)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      user = create(:user)
      expect {
        delete :destroy, id: user
      }.to change(User, :count).by(-1)
    end

    it "redirects to the field" do
      user = create(:user)
      delete :destroy, id: user
      expect(response).to redirect_to(admin_users_path)
    end
  end

  

end