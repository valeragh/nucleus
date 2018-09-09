require "rails_helper"

RSpec.describe "static_pages/price" do
  it "displays @cart, @categories, @reviews, @contact the static_pages" do
    assign(:static_pages, [
      @categories = [category = create(:category)],
      pod_category = create(:pod_category, category_id: category.id),
      @products = [create(:product, title: 'Товар', pod_category_id: pod_category.id, category_id: category.id)],
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612'),
      @reviews = [create(:review)]
    ])
    @q = Product.search(params[:q])
    
    render "layouts/header"
    render

    expect(rendered).to match /Товар/
    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
  end
end