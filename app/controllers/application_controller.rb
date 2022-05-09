class ApplicationController < ActionController::Base
  def homepage
    redirect_to("/users")
  end
end
