class StoresController < ApplicationController
  def category
  	@categories = Category.all.order(:rang)
  	@category = Category.friendly.find(params[:id])
  end

  def pod_category
  end

  def product
  end
end
