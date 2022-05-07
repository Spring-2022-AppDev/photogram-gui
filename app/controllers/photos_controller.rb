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

  def delete
    the_id = params.fetch(:photo_path)
    matching_photos = Photo.where(:id => the_id).first

    matching_photos.destroy
  redirect_to("/photos")
  end
end
