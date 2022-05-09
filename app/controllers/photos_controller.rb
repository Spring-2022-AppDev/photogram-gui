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

  def create
    input_image = params.fetch("new_photo")
    input_caption = params.fetch("new_photo_caption")
    input_user = params.fetch("new_photo_poster")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_user

    a_new_photo.save

  
    redirect_to("/photos/"+a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")
    the_photo = Photo.where(:id=>the_id).first
    
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption
    the_photo.save
    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def new_comment

    # insert_comment_record?input_photo_id=695&input_author_id=&input_body=

    
    #  body       :text
    #  created_at :datetime         not null
    #  updated_at :datetime         not null
    #  author_id  :integer
    #  photo_id   :integer

    the_id = params.fetch("input_photo_id")
    the_photo = Photo.where(:id=>the_id).first
    
    input_author = params.fetch("input_author_id")
    input_comment = params.fetch("input_body")
    
    the_comment = Comment.new
    the_comment.photo_id = the_photo
    the_comment.author_id = input_author
    the_comment.body = input_comment
    the_comment.save

    redirect_to("/photos/"+the_photo.id.to_s)
  end

end
