Rails.application.routes.draw do
  root :to => 'auth#index'
  post '/auth/:provider' => 'auth#authenticate'

  scope '/' do
    get '/user' => 'user#index' # private
    put '/user' => 'user#update' # private
    get '/user/:userId' => 'user#get_by_id' # public
  end

  scope '/note' do
    get '/' => 'note#index'
    get '/:noteId' => 'note#get_by_id'
    post '/' => 'note#new'
  end
end
