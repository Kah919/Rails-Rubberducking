Rails.application.routes.draw do
  resources :ducks, only: [:index]
  resources :students, only: [:index]

  get "/students/new", to: "students#new"
  post "/students", to: "students#create"
  get "/students/:id", to: "students#show", as: "student"
  get "/students/:id/edit", to: "students#edit", as: "students_edit"
  patch "/students/:id", to: "students#update"
  delete "/students/:id", to: "students#delete"

  get "/ducks/new", to: "ducks#new"
  post "/ducks", to: "ducks#create"
  get "/ducks/:id", to: "ducks#show", as: "duck"
  get "/ducks/:id/edit", to: "ducks#edit", as: "ducks_edit"
  patch "/ducks/:id", to: "ducks#update"
  delete "/ducks/:id", to: "ducks#delete"

end
