Rails.application.routes.draw do

  get("/", :controller =>"application", :action=>"homepage")
  
  get("/users", :controller =>"users", :action=>"index")
  
  get("/photos", :controller =>"photos", :action=>"index")

  get("/users/:username", :controller => "users", :action =>"show")

  
end
