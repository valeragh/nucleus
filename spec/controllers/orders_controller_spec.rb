require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "POST create" do
    
    context "with invalid attributes" do
      it "does not save the new order" do
        expect{
          post :create, order: FactoryGirl.attributes_for(:invalid_order)
        }.to_not change(Order, :count)
      end
      
      it "re-renders the new method" do
        post :create, order: FactoryGirl.attributes_for(:invalid_order)
        expect(response).to render_template :new
      end
    end 
  end

end
