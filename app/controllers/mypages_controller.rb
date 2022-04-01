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

  def post_state
    post = Post.find(params[:id])
      case post.post_published_state
      when 'personal'
        post.share!
        flash[:notice] = '公開にしました！'
        redirect_to mypage_path

      when 'share'
        post.personal!
        flash[:notice] = '非公開にしました！'
        redirect_to mypage_path
      else
        render :show
      end
  end


  #
  # def personal
  #   post = Post.find(params[:id])
  #   post.personal
  #   if post.save
  #     redirect_to mypage_path
  #   else
  #     render "show"
  #   end
  # end
  #
  # def share
  #   post = Post.find(params[:id])
  #   post.share
  #   if post.save
  #     redirect_to mypage_path
  #   else
  #     render "show"
  #   end
  # end

  def set_user
    @user = current_user
  end
end