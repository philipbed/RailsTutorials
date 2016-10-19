Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/",:to => "/index"
  get "/tasks" => "task#index"
  get "/tasks/new" => "tasks#new" , as: :newTask
end
