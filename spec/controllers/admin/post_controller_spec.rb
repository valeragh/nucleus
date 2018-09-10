require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do

  render_views
  let(:resource_class) { Post }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET #index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the post' do
      post = create(:post)
      get :index
      expect(assigns(:posts)).to include(post)
    end
    it "should render the expected columns" do
      post = create(:post)
      get :index
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.shot_description)
    end
    let(:filters_sidebar) { page.find('#filters_sidebar_section') }
    it "filter Title exists" do
      get :index
      expect(filters_sidebar).to have_css('label[for="q_title"]', text: 'Заголовок')
      expect(filters_sidebar).to have_css('input[name="q[title_contains]"]')
    end
    it "filter Title works" do
      matching_post = create(:post, title: 'test')
      non_matching_post = create(:post, title: 'non')

      get :index, q: { title_cont: 'test' }

      expect(assigns(:posts)).to include(matching_post)
      expect(assigns(:posts)).not_to include(non_matching_post)
    end
  end

  describe "GET #new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the post' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Вступление')
      expect(page).to have_field('Статья')
      expect(page).to have_field('Изображение')
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Post" do
        @attr = { 
          :title => 'test',
          :description => 'test',
          :shot_description => 'test',
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        expect {
          post :create, :post => @attr
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        @attr = { 
          :title => 'test',
          :description => 'test',
          :shot_description => 'test',
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        post :create, :post => @attr
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        @attr = { 
          :title => 'test',
          :description => 'test',
          :shot_description => 'test',
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        post :create, :post => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_post_path(Post.last))
      end

      it 'should create the post' do
        @attr = { 
          :title => 'test',
          :description => 'test',
          :shot_description => 'test',
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        post :create, :post => @attr
        post = Post.last

        expect(post.title).to  eq(@attr[:title])
        expect(post.description).to  eq(@attr[:description])
        expect(post.shot_description).to  eq(@attr[:shot_description])
      end
    end
  end

  describe "GET #edit" do
    it 'returns http success' do
      post = create(:post)
      get :edit, id: post
      expect(response).to have_http_status(:success)
    end
    it 'assigns the post' do
      post = create(:post)
      get :edit, id: post
      expect(assigns(:post)).to eq(post)
    end
    it "should render the form elements" do
      post = create(:post)
      get :edit, id: post
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Вступление')
      expect(page).to have_field('Статья')
      expect(page).to have_field('Изображение')
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      it 'assigns the post' do
        post = create(:post)
        @attr = { :title => 'test' }
        put :update, id: post, :post => @attr
        expect(assigns(:post)).to eq(post)
      end
      it 'returns http redirect' do
        post = create(:post)
        @attr = { :title => 'MyString' }
        put :update, id: post, :post => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_post_path(post))
      end
      it "should update the post" do
        post = create(:post)
        @attr = { 
          :title => 'test',
          :shot_description => 'test',
          :description => 'test' }
        put :update, id: post, :post => @attr
        post.reload
        expect(post.title).to  eq(@attr[:title])
        expect(post.shot_description).to  eq(@attr[:shot_description])
        expect(post.description).to  eq(@attr[:description])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        post = create(:post)
        @attr = { :title => '' }
        put :update, id: post, :post => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change post' do
        post = create(:post)
        @attr = { :title => '' }
        expect do
          put :update, id: post, :post => @attr
        end.not_to change { post.reload.title }
      end
    end
  end

   describe "GET #show" do
    it 'returns http success' do
      post = create(:post)
      get :show, id: post
      expect(response).to have_http_status(:success)
    end
    it 'assigns the post' do
      post = create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq(post)
    end
    it "should render the form elements" do
      post = create(:post)
      get :show, id: post
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.shot_description)
      expect(page).to have_content(post.description)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      post = create(:post)
      expect {
        delete :destroy, id: post
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the field" do
      post = create(:post)
      delete :destroy, id: post
      expect(response).to redirect_to(admin_posts_path)
    end
  end

  

end