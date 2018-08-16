require "rails_helper"

RSpec.describe "static_pages/terms_of_use" do
  it "displays @cart, @contact the static_pages" do
    assign(:static_pages, [
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612')
    ])
    @q = Product.search(params[:q])
    
    render "layouts/header"
    render

    expect(rendered).to match /Пользовательское соглашение/
    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
  end
end