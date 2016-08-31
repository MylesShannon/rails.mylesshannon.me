class ApplicationController < ActionController::Base

  before_filter :csrf_check

  private

  def csrf_check
    if request.headers['X-XSRF-TOKEN'] != session['XSRF-TOKEN'] && request.post?
      puts "unauthorized"
      head :unauthorized
    end
    token = SecureRandom.base64(100)
    if Rails.env.production?
      cookies['XSRF-TOKEN'] = {
        value: token,
        expires_after: 'Session',
        domain: '.mylesshannon.me'
      }
    else
      cookies['XSRF-TOKEN'] = {
        value: token,
        expires_after: 'Session',
        domain: 'localhost'
      }
    end
    session['XSRF-TOKEN'] = token
  end

  def authenticate_user!
    unauthorized! unless current_user
  end
  
  def unauthorized!
    head :unauthorized
  end

  def current_user
    @current_user
  end

  def set_current_user
    token = request.headers['Authorization'].to_s.split(' ').last
    return unless token

    payload = Token.new(token)

    @current_user = User.find(payload.user_id) if payload.valid?
  end
end
