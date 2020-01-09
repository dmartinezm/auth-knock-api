Rails.application.routes.draw do
  # scope '/api/v1' do
   # Get login token from Knock
    post 'user_token' => 'user_token#create'
    # Login Controller
    get 'auth' => 'login#auth'

    #user actions
    resources :users
   
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
