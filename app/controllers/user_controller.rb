class UserController < ApplicationController
  before_filter :set_current_user, :authenticate_user!, :except => [:get_by_id]

  def index
    @user = current_user
    render 'user/user', formats: [:json], handlers: [:jbuilder], status: 200
  end

  def get_by_id
    # render json: get_user(params[:userId])
  end

  def update
    current_user.update api_params

    head :no_content
  end

  private

  def api_params
    params.require(:user).permit(:email, :displayName)
  end
end
