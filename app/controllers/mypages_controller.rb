class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def index
  end

  def show
    @user = current_user
    @posts =Post.where(user_id: @user.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to mypage_path
  end

  def set_user
    @user = current_user
  end
end