require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
      expect(response.body).to eq ""
    end

  end

  describe "GET #about_us" do
    it "returns http success" do
      get :about_us
      expect(response).to have_http_status(:success)
    end

    it "renders the about_us template" do
      get :about_us
      expect(response).to render_template("about_us")
      expect(response.body).to eq ""
    end
  end

  describe "GET #price" do
    it "returns http success" do
      get :price
      expect(response).to have_http_status(:success)
    end

    it "renders the price template" do
      get :price
      expect(response).to render_template("price")
      expect(response.body).to eq ""
    end
  end

  describe "GET #contacts" do
    it "returns http success" do
      get :contacts
      expect(response).to have_http_status(:success)
    end

    it "renders the contacts template" do
      get :contacts
      expect(response).to render_template("contacts")
      expect(response.body).to eq ""
    end
  end

  describe "GET #faqs" do
    it "returns http success" do
      get :faqs
      expect(response).to have_http_status(:success)
    end

    it "renders the faqs template" do
      get :faqs
      expect(response).to render_template("faqs")
      expect(response.body).to eq ""
    end
  end

  describe "GET #terms_of_use" do
    it "returns http success" do
      get :terms_of_use
      expect(response).to have_http_status(:success)
    end

    it "renders the terms_of_use template" do
      get :terms_of_use
      expect(response).to render_template("terms_of_use")
      expect(response.body).to eq ""
    end
  end

  describe "GET #privacy_policy" do
    it "returns http success" do
      get :privacy_policy
      expect(response).to have_http_status(:success)
    end

    it "renders the privacy_policy template" do
      get :privacy_policy
      expect(response).to render_template("privacy_policy")
      expect(response.body).to eq ""
    end
  end

  describe "GET #sitemap_html" do
    it "returns http success" do
      get :sitemap_html
      expect(response).to have_http_status(:success)
    end

    it "renders the sitemap_html template" do
      get :sitemap_html
      expect(response).to render_template("sitemap_html")
      expect(response.body).to eq ""
    end
  end

end
