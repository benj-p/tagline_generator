Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  post '/generate_tagline', to: "pages#generate_tagline", as: :generate_tagline
end
