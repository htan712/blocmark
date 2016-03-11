class BookmarksController < ApplicationController

  before_action :require_sign_in, except: [:show]
  before_action :find_bookmark, except: [:new, :create]

  def index
  end

  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @topic
    else
      flash[:alert] = "There was an error saving the bookmark. Try again."
      render :new
    end
  end

  def edit
  end

  def update
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark updated."
      redirect_to [@bookmark.topic]
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :description)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
