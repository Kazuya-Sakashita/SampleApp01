class BookmarksController < ApplicationController


  def create
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_back fallback_location: root_path, success: 'ブックマークしました'
  end

  def destroy
    post = current_user.bookmarks.find_by(params[:id]).post
    current_user.unbookmark(post)
    redirect_back fallback_location: root_path, success: 'ブックマークを外しました'
  end
end