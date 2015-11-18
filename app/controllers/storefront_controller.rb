class StorefrontController < ApplicationController



  def all_items
  	@products = Product.all
  end

  def items_by_category
  	@products = Product.where(catergory_id: params[:cat_id])
  	@category = Category.find(params[:cat_id])
  end

  def items_by_brand
  	@products = Product.where(brand: params[:brand])
  	@brand = params[:brand]
  end

  # def add_to_cart
  #   product = Product.find(params[:product_id])
  #   if product.quantity < params[:quantity].to_i
  #     redirect_to product, notice: "Not enough quantity in stock."
  #   else

  #   line_item = LineItem.new
  #   line_item.product_id = params[:product_id].to_i
  #   line_item.quantity = params[:quantity]
  #   line_item.save

  #   line_item.line_item_total = line_item.quantity * line_item.product.price
  #   line_item.save 

  #   redirect_to view_order_path

  #   end 
  # end

end
