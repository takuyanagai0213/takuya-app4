class UsersController < ApplicationController
  #before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @categories = Category.all
    @users = User.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @categories = Category.all
  end

  def new
    @categories = Category.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @categories = Category.all
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザ情報を更新しました。"
      render :show
    else
      render :edit
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザを削除しました。"
    redirect_to root_url
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
