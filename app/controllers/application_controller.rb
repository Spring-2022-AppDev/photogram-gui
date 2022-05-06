class ApplicationController < ActionController::Base
  def homepage
    render({:template => "executive/homepage.html.erb"})
  end
end
