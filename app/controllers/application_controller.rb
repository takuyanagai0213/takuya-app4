class ApplicationController < ActionController::Base
  before_action :category_all

  include SessionsHelper
  include UsersHelper
  
  private

  def category_all
    @categories = Category.all
  end

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
