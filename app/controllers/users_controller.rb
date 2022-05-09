class UsersController < ApplicationController
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

  def insert

    # https://3000-spring2022a-photogramgu-7ieuz8ylabg.ws-us44.gitpod.io/insert_user_record?input_username=Sam
    new_user = params.fetch("input_username")
    a_new_user = User.new
    a_new_user.username = new_user
    a_new_user.save
    
    redirect_to("/users")
  end

  def update_username
    # https://3000-spring2022a-photogramgu-7ieuz8ylabg.ws-us44.gitpod.io/edit_user?updated_username=Sam
    new_username = params.fetch("updated_username")
    
    render(:template=>"photos/update.html.erb")
  end


  # input_image = params.fetch("image_url")
  #   input_caption = params.fetch("image_caption")
  #   input_user = params.fetch("image_poster")

  #   a_new_photo = Photo.new
  #   a_new_photo.image = input_image
  #   a_new_photo.caption = input_caption
  #   a_new_photo.user = input_user

end
