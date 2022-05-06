class PhotosController < ApplicationController
  def index
    photos = Photo.all
    @list_of_photos = photos.order(:created_at=>:desc)
    render({:template => "photos/index.html.erb"})
  end

  def show
    @path = params.fetch(:photo_path)
    @photo =Photo.where(:id=>@path).at(0)

    render({:template=>"photos/view.html.erb"})
  end
end
