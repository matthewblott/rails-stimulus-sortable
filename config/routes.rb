Rails.application.routes.draw do
  resources(:tasks)
  # patch("/tasks", to: "tasks#sort", as: "sort_task")
  patch("/tasks/status/:id", to: "tasks#status", as: "status_task")
  root("tasks#index")
end
