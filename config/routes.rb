Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/",:to => "/index"
  get "/tasks" => "task#index"
  post "/tasks" => "task#create"
  get "/tasks/new" => "task#new" , as: :newTask

  get "/tasks/:id" => "task#show", as: :task
  patch "/tasks/:id" => "task#update"
  get "/tasks/:id/edit" => "task#edit"

  delete "/tasks/:id" => "task#destroy"

end
