class UsersController < ApplicationController
  def insert

    # https://3000-spring2022a-photogramgu-7ieuz8ylabg.ws-us44.gitpod.io/insert_user_record?input_username=Sam
    new_user = params.fetch("input_username")
    a_new_user = User.new
    a_new_user.username = new_user
    a_new_user.save
    
    redirect_to("/users/" + a_new_user.username)
  end
  
  def index
    matching_users = User.all
    @list_of_users = matching_users.order(:username => :asc)


    render({:template=> "users/index.html.erb"})
  end

  def show
    @user_string = params.fetch(:username)
    @user = User.where(:username=> @user_string).at(0)
    

    if :username == nil 
      redirect_to("/")
    else
      render({:template=>"users/show.html.erb"})
    end
  end


  def update_username
    # https://3000-spring2022a-photogramgu-7ieuz8ylabg.ws-us44.gitpod.io/users/Hello/edit_user?updated_username=update

    # the_id = params.fetch("modify_id")
    # the_photo = Photo.where(:id=>the_id).first
    
    # input_image = params.fetch("input_image")
    # input_caption = params.fetch("input_caption")

    # the_photo.image = input_image
    # the_photo.caption = input_caption
    # the_photo.save
    # redirect_to("/photos/" + the_photo.id.to_s)
    old_username = params.fetch(:old_username)
    new_username = params.fetch("updated_username")
    user = User.where(:username=>old_username).first

    user.username = new_username
    user.save
    
    redirect_to("/users/" + user.username)
  end


  # input_image = params.fetch("image_url")
  #   input_caption = params.fetch("image_caption")
  #   input_user = params.fetch("image_poster")

  #   a_new_photo = Photo.new
  #   a_new_photo.image = input_image
  #   a_new_photo.caption = input_caption
  #   a_new_photo.user = input_user

end
