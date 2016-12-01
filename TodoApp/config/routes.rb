Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # todolist routes
  # resources :posts
  root to: "todo_list#index"

  post "/lists" => "todo_list#create"
  get "/lists/:id" => "todo_list#show", as: :list

  # task routes
  get "/tasks" => "task#index"
  post "/tasks" => "task#create"
  get "/tasks/new" => "task#new" , as: :newTask

  get "/tasks/:id" => "task#show", as: :task
  patch "/tasks/:id" => "task#update"
  get "/tasks/:id/edit" => "task#edit"

  delete "/tasks/:id" => "task#destroy"



end
