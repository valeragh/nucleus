require 'rails_helper'

RSpec.describe Admin::ContactsController, type: :controller do

  render_views
  let(:resource_class) { Contact }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the contact' do
      contact = create(:contact)
      get :index
      expect(assigns(:contacts)).to include(contact)
    end
    it "should render the expected columns" do
      contact = create(:contact)
      get :index
      expect(page).to have_content(contact.address)
      expect(page).to have_content(contact.phones)
      expect(page).to have_content(contact.title)
      expect(page).to have_content(contact.status)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the contact' do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Названия магазина')
      expect(page).to have_field('Адрес')
      expect(page).to have_field('Телефон')
      expect(page).to have_field('Телефон два')
      expect(page).to have_field('Описание магазина')
    end
  end

  describe "GET edit" do
    it 'returns http success' do
      contact = create(:contact)
      get :edit, id: contact
      expect(response).to have_http_status(:success)
    end
    it 'assigns the contact' do
      contact = create(:contact)
      get :edit, id: contact
      expect(assigns(:contact)).to eq(contact)
    end
    it "should render the form elements" do
      contact = create(:contact)
      get :edit, id: contact
      expect(page).to have_field('Названия магазина')
      expect(page).to have_field('Адрес')
      expect(page).to have_field('Телефон')
      expect(page).to have_field('Телефон два')
      expect(page).to have_field('Описание магазина')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the contact' do
        contact = create(:contact)
        @attr = {
         :title => 'MyString',
         :address=>'MyString',
         :phone_one => 'MyString',
         :phone_two=>'MyString',
         :description=>'MyString',
         :status => 'Показать',
         :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        put :update, id: contact, :contact => @attr
        expect(assigns(:contact)).to eq(contact)
      end
      it 'returns http redirect' do
        contact = create(:contact)
        @attr = {
         :title => 'MyString',
         :address=>'MyString',
         :phone_one => 'MyString',
         :phone_two=>'MyString',
         :description=>'MyString',
         :status => 'Показать',
         :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        put :update, id: contact, :contact => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_contact_path(contact))
      end
      it "should update the contact" do
        contact = create(:contact)
        @attr = {
         :title => 'MyString',
         :address=>'MyString',
         :phone_one => 'MyString',
         :phone_two=>'MyString',
         :description=>'MyString',
         :status => 'Показать',
         :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        put :update, id: contact, :contact => @attr
        contact.reload
        expect(contact.title).to  eq(@attr[:title])
        expect(contact.address).to  eq(@attr[:address])
        expect(contact.phone_one).to  eq(@attr[:phone_one])
        expect(contact.phone_two).to  eq(@attr[:phone_two])
        expect(contact.description).to  eq(@attr[:description])
        expect(contact.status).to  eq(@attr[:status])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        contact = create(:contact)
        @attr = { :title => '' }
        put :update, id: contact, :contact => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change contact' do
        contact = create(:contact)
        @attr = { :title => '' }
        expect do
          put :update, id: contact, :contact => @attr
        end.not_to change { contact.reload.title }
      end
    end
  end

   describe "GET show" do
    it 'returns http success' do
      contact = create(:contact)
      get :show, id: contact
      expect(response).to have_http_status(:success)
    end
    it 'assigns the contact' do
      contact = create(:contact)
      get :show, id: contact
      expect(assigns(:contact)).to eq(contact)
    end
    it "should render the form elements" do
      contact = create(:contact)
      get :show, id: contact
      expect(page).to have_content(contact.address)
      expect(page).to have_content(contact.phones)
      expect(page).to have_content(contact.title)
      expect(page).to have_content(contact.status)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      contact = create(:contact)
      expect {
        delete :destroy, id: contact
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the field" do
      contact = create(:contact)
      delete :destroy, id: contact
      expect(response).to redirect_to(admin_contacts_path)
    end
  end

  

end