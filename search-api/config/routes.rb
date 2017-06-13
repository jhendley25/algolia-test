Rails.application.routes.draw do
  # resources :apps

  scope("/api/1") do
    get '/apps' => 'mobile_apps#index'
    put '/apps/:id' => 'mobile_apps#update'
    post '/apps' => 'mobile_apps#create'
    delete '/apps/:id' => 'mobile_apps#destroy'
  end
end
