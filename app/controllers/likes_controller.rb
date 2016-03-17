class LikesController < ApplicationController
  before_action :require_sign_in

  def create
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Liked Bookmark."
    else
      flash[:alert] = "Please Try again."
    end
    redirect_to [bookmark.topic, bookmark]
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Unliked Bookmark."
    else
      flash[:alert] = "Please Try again."
    end
    redirect_to [bookmark.topic, bookmark]
  end
end
