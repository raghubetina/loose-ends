Rails.application.routes.draw do
  resources :tasks

  # get("/whatever")
  # Routes for the Pet resource:

  # get("/", { :controller => "pets", :action => "index" })

  # get({ "/" => "pets#index" })

  root "pets#index"

  resources :pets


  # # CREATE
  # post("/pets", { :controller => "pets", :action => "create" })
          
  # # READ
  # get("/pets", { :controller => "pets", :action => "index" })
  
  # get("/pets/new", { :controller => "pets", :action => "new" })

  # get("/pets/:id", { :controller => "pets", :action => "show" })
  
  # get("/pets/:id/edit", { :controller => "pets", :action => "edit" })
  
  # # UPDATE
  
  # patch("/pets/:id", { :controller => "pets", :action => "update" })
  
  # # DELETE
  # delete("/pets/:id", { :controller => "pets", :action => "destroy" })

  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
