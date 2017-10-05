Rails.application.routes.draw do
  root 'number_conversions#index'
  post '/' => 'number_conversions#index'
  get '/base/:urlbase' =>  'number_conversions#index'
  post '/base/:urlbase' => 'number_conversions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
