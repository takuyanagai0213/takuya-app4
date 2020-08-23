class ApplicationController < ActionController::Base
  before_action :category_all
  before_action :information_all
  before_action :area_all


  include SessionsHelper
  include UsersHelper
  
  private

  def category_all
    @categories = Category.all
  end

  def area_all
    @areas = Area.all
  end

  def information_all
    @reports = Report.all
  end

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
