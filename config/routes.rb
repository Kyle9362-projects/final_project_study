Rails.application.routes.draw do
  # Routes for the Study resource:
  # CREATE
  get "/studies/new", :controller => "studies", :action => "new"
  post "/create_study", :controller => "studies", :action => "create"

  # READ
  get "/studies", :controller => "studies", :action => "index"
  get "/studies/:id", :controller => "studies", :action => "show"

  # UPDATE
  get "/studies/:id/edit", :controller => "studies", :action => "edit"
  post "/update_study/:id", :controller => "studies", :action => "update"

  # DELETE
  get "/delete_study/:id", :controller => "studies", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
