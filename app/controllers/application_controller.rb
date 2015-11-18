class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_filter :categories
 before_filter :brands
 before_filter :line_items

  def categories
  	@categories = Category.all
	end 

	def brands
		@brands = Product.pluck(:brand).sort.uniq!
	end

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name, :address, :state, :city, :zip, :admin) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :address, :state, :city, :zip, :admin) }

  end

  def line_items
    @line_items = LineItem.all
  end

end

