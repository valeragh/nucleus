require 'rails_helper'

RSpec.describe Admin::LettersController, type: :controller do

  render_views
  let(:resource_class) { Letters }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the letter' do
      letter = create(:letter)
      get :index
      expect(assigns(:letters)).to include(letter)
    end
    it "should render the expected columns" do
      letter = create(:letter)
      get :index
      expect(page).to have_content(letter.name)
      expect(page).to have_content(letter.description)
      expect(page).to have_content(letter.email)
    end
    let(:filters_sidebar) { page.find('#filters_sidebar_section') }
    it "filter name and email exists" do
      get :index
      expect(filters_sidebar).to have_css('label[for="q_email"]', text: 'Email')
      expect(filters_sidebar).to have_css('input[name="q[email_contains]"]')
      expect(filters_sidebar).to have_css('label[for="q_name"]', text: 'Имя')
      expect(filters_sidebar).to have_css('input[name="q[name_contains]"]')
    end
    it "filter Name works" do
      matching_letter = create(:letter, name: 'test')
      non_matching_letter = create(:letter, name: 'qwer')

      get :index,  q: { name_cont: 'test' } 

      expect(assigns(:letters)).to include(matching_letter)
      expect(assigns(:letters)).not_to include(non_matching_letter)
    end
  end

  describe "GET #edit" do
    it 'returns http success' do
      letter = create(:letter)
      get :edit, id: letter
      expect(response).to have_http_status(:success)
    end
    it 'assigns the letter' do
      letter = create(:letter)
      get :edit, id: letter
      expect(assigns(:letter)).to eq(letter)
    end
    it "should render the form elements" do
      letter = create(:letter)
      get :edit, id: letter
      expect(page).to have_field("Дата ответа", :type => "text")
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      it 'assigns the letter' do
        letter = create(:letter)
        @attr = { :checked_out_at => Time.now }
        put :update, id: letter, :letter => @attr
        expect(assigns(:letter)).to eq(letter)
      end
      it 'returns http redirect' do
        letter = create(:letter)
        @attr = { :checked_out_at => Time.now }
        put :update, id: letter, :letter => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_letter_path(letter))
      end
      it "should update the letter" do
        letter = create(:letter)
        @attr = { :checked_out_at => "2018-03-18 18:17:35" }
        put :update, id: letter, :letter => @attr
        letter.reload
        expect(letter.checked_out_at).to  eq(@attr[:checked_out_at])
      end
    end
  end

   describe "GET #show" do
    it 'returns http success' do
      letter = create(:letter)
      get :show, id: letter
      expect(response).to have_http_status(:success)
    end
    it 'assigns the letter' do
      letter = create(:letter)
      get :show, id: letter
      expect(assigns(:letter)).to eq(letter)
    end
    it "should render the form elements" do
      letter = create(:letter)
      get :show, id: letter
      expect(page).to have_content(letter.name)
      expect(page).to have_content(letter.description)
      expect(page).to have_content(letter.email)
      expect(page).to have_content(letter.state)
    end
  end

end