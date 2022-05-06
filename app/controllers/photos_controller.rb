class PhotosController < ApplicationController
  def index
    render({:template => "photos/index.html.erb"})
  end
end
