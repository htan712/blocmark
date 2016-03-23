class UsersController < ApplicationController
  before_action :authorize_user_admin?, only: [:destroy, :update]
  before_action :require_sign_in, except: [:show]


  def index
    @users = User.all
    @user_roles = User.roles.keys.map {|role| [role.titleize,role]}
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(role: params[:user][:role])
    authorize @user

    if @user.save
      redirect_to root_path, notice: "Updated User."
    else
      flash.now[:alert] = "Error updating. Please try again."
      render :index
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User has been deleted."
      render :index
    else
      flash[:alert] = "You must be an admin to do this."
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

  def authorize_user_admin?
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end
end
