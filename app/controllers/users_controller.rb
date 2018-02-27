class UsersController < ApplicationController
  before_action :user_compare, only: %i[show edit update destroy]
  helper_method :current_user

  def index
     @user = User.all
   end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @user.destroy

    redirect_to users_path
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def current_user
    @current_user ||= User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

    def user_compare
      @user = User.find(params[:id])
    end
end
