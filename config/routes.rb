Rails.application.routes.draw do
  root :to => 'auth#index'

  scope '/api' do
    scope '/v1' do
      get '/' => 'auth#index'
      post '/auth/:provider' => 'auth#authenticate'

      scope '/note' do
        get '/' => 'note#index'
        get '/:noteId' => 'note#get_by_id'
        post '/' => 'note#new'
        delete '/:noteId' => 'note#delete'
      end

      scope '/user' do
        get '/' => 'user#index' # private
        put '/' => 'user#update' # private
        get '/:userId' => 'user#get_by_id' # public
      end
    end
  end
end
