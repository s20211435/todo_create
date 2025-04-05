class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_user

  def index
    @users = User.all
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
      redirect_to admin_users_path, notice: "ユーザーが作成されました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザーが更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザーが削除されました。"
    else
      redirect_to admin_users_path, alert: "ユーザーの削除に失敗しました。"
    end
  end

  private

  def ensure_admin_user
    unless current_user.admin?
      redirect_to root_path, alert: "管理者権限が必要です。"
    end
  end
end
