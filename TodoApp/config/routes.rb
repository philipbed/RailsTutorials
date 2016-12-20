Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # todolist routes
  # resources :posts
  resources :todo_lists do
    resources :tasks
  end
  root to: "todo_list#index"

  get "/lists/new" => "todo_list#new", as: :newList
  post "/lists" => "todo_list#create"
  get "/lists/:id" => "todo_list#show", as: :list

  # task routes
  get "lists/:todo_list_id/tasks" => "task#index"
  post "lists/:todo_list_id/tasks" => "task#create"
  get "lists/:todo_list_id/tasks/new" => "task#new" , as: :newTask

  get "lists/:todo_list_id/tasks/:id" => "task#show", as: :task
  patch "lists/:todo_list_id/tasks/:id" => "task#update"
  get "lists/:todo_list_id/tasks/:id/edit" => "task#edit", as: :editTask

  delete "lists/:todo_list_id/tasks/:id" => "task#destroy", as: :deleteTask



end
