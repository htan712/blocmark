class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :find_topic, except: [:index, :new, :create]
  before_action :authorize_user_admin, except: [:index, :show]
  before_action :authorize_user_moderator, only: [:edit, :update]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    authorize @topic

    if @topic.save
      redirect_to @topic, notice: "Topic created."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    authorize @topic
  end

  def update
    @topic.assign_attributes(topic_params)
    authorize @topic

    if @topic.save
      redirect_to @topic, notice: "Updated Topic."
    else
      flash.now[:alert] = "Error updating. Please try again."
      render :edit
    end
  end

  def destroy
    authorize @topic

    if @topic.destroy
      flash[:notice] ="\"#{@topic.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash[:alert] = "There was an error deleting the topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def authorize_user_admin?
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end

  def topic_policy
    authorize @topic
  end
end
