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

end
