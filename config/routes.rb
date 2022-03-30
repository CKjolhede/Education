Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/schools', to: 'schools#index'
  get '/schools/:id', to: "schools#show"
  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'
  get '/schools/:school_id/students', to: 'school_students#index'
  get '/schools/new.html.erb', to: 'schools#new'
  post '/schools', to: 'schools#create'
  get '/schools/:id/edit', to: 'schools#edit'
  get '/schools/@school.id/edit', to: 'schools#edit'
  patch '/schools/:id', to: 'schools#update'
end
