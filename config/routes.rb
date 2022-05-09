Rails.application.routes.draw do

  get("/", :controller =>"application", :action=>"homepage")
  
  get("/users", :controller =>"users", :action=>"index")
  
  get("/photos", :controller =>"photos", :action=>"index")

  get("/users/:username", :controller => "users", :action =>"show")
  
  get("/photos/:photo_path", :controller => "photos", :action =>"show")
  
  get("/delete_photo/:photo_path", :controller => "photos", :action =>"delete")
  
  get("/add_photo", {:controller => "photos", :action =>"create"})
  
  get("/insert_user_record", :controller => "users", :action=>"insert")

  get("/update_photo/:modify_id", :controller=>"photos", :action=>"update")

get("/insert_comment_record", :controller=>"photos", :action=>"new_comment")

get("/edit_user", :controller=>"users", :action=>"update_username")

  
end
