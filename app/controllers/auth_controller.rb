class AuthController < ApplicationController

  def render_data(data, status)
    render json: data, status: status, callback: params[:callback]
  end

  def render_error(message, status = :unprocessable_entity)
    render_data({ error: message }, status)
  end

  def render_success(data, status = :ok)
    if data.is_a? String
      render_data({ message: data }, status)
    else
      render_data(data, status)
    end
  end

  def authenticate
    @oauth = "Oauth::#{params['provider'].titleize}".constantize.new(params)     
    if @oauth.authorized?
      @user = check_or_create_user(@oauth.formatted_user_data)
      if @user
        render_success(token: Token.encode(@user.id), id: @user.id)
      else
        render_error "This #{params[:provider]} account is used already"
      end
    else
      render_error("There was an error with #{params['provider']}. please try again.")
    end
  end

  def check_or_create_user(params)
    params = params.smash.with_indifferent_access

    if User.exists?(provider: params[:provider], uid: params[:uid])
      user = User.where(provider: params[:provider], uid: params[:uid]).first
      puts "USER EXISTS - #{user.id}"
    else
      user = User.new
      user.uid = params[:uid]
      user.provider = params[:provider]
      user.token  = params[:token]
      user.email = params[:email]
      fallback_name        = params[:name].split(" ") if params[:name]
      fallback_first_name  = fallback_name.try(:first)
      fallback_last_name   = fallback_name.try(:last)
      user.first_name    ||= (params[:first_name] || fallback_first_name)
      user.last_name     ||= (params[:last_name]  || fallback_last_name)
      user.image = params[:image_url]
      user.display_name = user.first_name
      user.save
      puts "NEW USER - #{user.id}"
    end

    return user
  end

end
