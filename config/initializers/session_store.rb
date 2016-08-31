# Be sure to restart your server when you modify this file.
if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: 'rails_session', domain: '.mylesshannon.me'
end

if Rails.env.development?  || Rails.env.test? 
  Rails.application.config.session_store :cookie_store, key: 'rails_session', domain: 'localhost'
end