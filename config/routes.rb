
Rails.application.routes.draw do

constraints Clearance::Constraints::SignedIn.new do
   root to: "dashboards#show"

 end



  root to: "homes#show" , 
  constraints: lambda { |req| req.session[:user_id].nil? }, as: nil
  resources :shouts, only: [:create, :show]

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end


  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
