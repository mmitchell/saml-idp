Rails.application.routes.draw do

  root 'welcome#index'

  get '/saml/auth' => 'saml_idp#new'
  post '/saml/auth' => 'saml_idp#create'

end
