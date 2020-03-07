Rails.application.routes.draw do
  post 'control', to: 'dashboard#control'
  root to: "dashboard#index"
end
