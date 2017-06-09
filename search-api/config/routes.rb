Rails.application.routes.draw do
  # resources :apps
  
  scope("/api/1") do
    get '/apps' => 'apps#index'
    put '/apps/:id' => 'apps#update'
    post '/apps' => 'apps#create'
    delete '/apps/:id' => 'apps#destroy'
  end
end
