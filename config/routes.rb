Rails.application.routes.draw do

  get("/", :controller =>"application", :action=>"homepage")
  
  get("/users", :controller =>"users", :action=>"index")
  
  get("/photos", :controller =>"photos", :action=>"index")

  get("/users/:username", :controller => "users", :action =>"show")
  
  get("/photos/:photo_path", :controller => "photos", :action =>"show")
  
  get("/delete_photo/:photo_path", :controller => "photos", :action =>"delete")

  
end
