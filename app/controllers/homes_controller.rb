class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @user = current_user
    @posts = Post.find_by(user_id: current_user.id)
  end

  def show
    @user = current_user
    @posts = Post.find_by(user_id: current_user.id)
  end

  private

  def set_user
    @user = current_user
  end
end
