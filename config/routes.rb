Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'log', action: :log, controller: 'log' 
  post 'execute', action: :execute, controller: 'transaction'
end
