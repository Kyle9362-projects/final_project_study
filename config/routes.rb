Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "studies#index"
  # Routes for the Datatype resource:
  # CREATE
  get "/datatypes/new", :controller => "datatypes", :action => "new"
  post "/create_datatype", :controller => "datatypes", :action => "create"

  # READ
  get "/datatypes", :controller => "datatypes", :action => "index"
  get "/datatypes/:id", :controller => "datatypes", :action => "show"

  # UPDATE
  get "/datatypes/:id/edit", :controller => "datatypes", :action => "edit"
  post "/update_datatype/:id", :controller => "datatypes", :action => "update"

  # DELETE
  get "/delete_datatype/:id", :controller => "datatypes", :action => "destroy"
  #------------------------------

  # Routes for the Record resource:
  # CREATE
  get "/records/new", :controller => "records", :action => "new"
  post "/create_record", :controller => "records", :action => "create"

  # READ
  get "/records", :controller => "records", :action => "index"
  get "/records/:id", :controller => "records", :action => "show"

  # UPDATE
  get "/records/:id/edit", :controller => "records", :action => "edit"
  post "/update_record/:id", :controller => "records", :action => "update"

  # DELETE
  get "/delete_record/:id", :controller => "records", :action => "destroy"
  #------------------------------

  # Routes for the Subject resource:
  # CREATE
  get "/subjects/new", :controller => "subjects", :action => "new"
  post "/create_subject", :controller => "subjects", :action => "create"

  # READ
  get "/subjects", :controller => "subjects", :action => "index"
  get "/subjects/:id", :controller => "subjects", :action => "show"

  # UPDATE
  get "/subjects/:id/edit", :controller => "subjects", :action => "edit"
  post "/update_subject/:id", :controller => "subjects", :action => "update"

  # DELETE
  get "/delete_subject/:id", :controller => "subjects", :action => "destroy"
  #------------------------------

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
