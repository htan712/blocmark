class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :find_topic, except: [:index, :new, :create]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic, notice: "Topic created."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
    end
  end

  def edit
  end

  def update
    @topic.assign_attributes(topic_params)

    if @topic.save
      redirect_to @topic, notice: "Updated Topic."
    else
      flash.now[:alert] = "Error updating. Please try again."
      render :edit
    end
  end

  def destroy
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
end
