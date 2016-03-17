class BookmarksController < ApplicationController

  before_action :require_sign_in, except: [:show]
  before_action :find_bookmark, except: [:new, :create, :index]
  after_action :verify_authorized, only: [:destroy, :new, :create]

  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark

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
      redirect_to @bookmark.topic, notice: "Bookmark updated."
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    authorize@bookmark
    if @bookmark.destroy
      redirect_to @bookmark.topic, notice: "\"#{@bookmark.url}\" was deleted successfully."

    else
      flasth.now[:alert] = "There was an error deleting the bookmark."
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
