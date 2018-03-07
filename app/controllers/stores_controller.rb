class StoresController < ApplicationController
  def category
  	@categories = Category.all.order(:rang)
  	@category = Category.friendly.find(params[:id])
  end

  def pod_category
  	@categories = Category.all.order(:rang)
  	@pod_category = PodCategory.friendly.find(params[:id])
  end

  def product
  end
end
