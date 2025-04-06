class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_user

  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: "ユーザーが作成されました。" }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to admin_user_path(@user), notice: "ユーザーが更新されました。" }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: "ユーザーが削除されました。" }
      format.turbo_stream
    end
  end

  private

  def ensure_admin_user
    unless current_user.admin?
      redirect_to root_path, alert: "管理者権限が必要です。"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
