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
    # https://3000-spring2022a-photogramgu-7ieuz8ylabg.ws-us44.gitpod.io/add_photo?new_photo=data%3Aimage%2Fjpeg%3Bbase64%2C%2F9j%2F4AAQSkZJRgABAQAAAQABAAD%2F2wCEAAoHCBQUERcUERQYGBcXFxkXGhoaFxcYFxgaFxgaGBgZGRgaICwkGhwoIBgYJDckKC4vMj8yGSI4PTgwPCwxMy8BCwsLDw4PHRERHTMpIygxMy8zMy80NDQzMzExLzExMTMvMTMxMTExMzEzMTMxMTE6MzExMTExMTEvMTExMTExMf%2FAABEIALcBEwMBIgACEQEDEQH%2FxAAbAAABBQEBAAAAAAAAAAAAAAAAAQMEBQYCB%2F%2FEAD8QAAIBAwMCBAQEAwcEAAcAAAECEQADIQQSMQVBEyJRYTJxgZEGI0KhscHRFFJicpLh8DNDU4IVJCVzg6Lx%2F8QAGgEAAgMBAQAAAAAAAAAAAAAAAAMBAgQFBv%2FEADERAAICAQMCBAMIAgMAAAAAAAABAhEDBBIhMVETQWFxBRQiIzKBkaGxwfAVMyRy0f%2FaAAwDAQACEQMRAD8A8pooiiK99RlCiiKIooLCiiKIqaCwooiliigsSiiKIqaICiiKIooAooiiKKAKKIoiiiQooiiKKAKKIoiooAooiiKKAKKIoiigCiiiKKAKKIoooAoooqKAKSloooBKKWiooAoooooDqKXbXe2lirlNw3tpdtObaNtBG4b20bad20bakjcN7aSKd20baCdw1to207tpNtAbhrbRFO7aNtAbhqKIp3bRtoDcNbaNtO7aUJQG4aikinttJtoDcNRRFO7aNtAbhqKIp3bRtoDcNRRFORRFBO4biiKciiKA3DcUm2nYoigNw1toinYpNtAbhqKIpzbRtoJsaiiKc20m2oCziKK7iloJse20u2u4pYqBG4420Bacil20EbhvbRtp3bRtqSNw3FEU7toK1JG4Z20m2nttJtoJ3DW2jbTsUbaCdw1to207toC0BuG4rtbflJ9I%2Fepmg0Ny84t2lLMZgD2En9hVwn4cubWXxLO4xjxrU4P%2Bas%2BXUY8b2zkkyUpS6IzJWkirXqXSb&new_photo_caption=+Test+again&new_photo_poster=117

  input_image = params.fetch("new_photo")
  input_caption = params.fetch("new_photo_caption")
  input_poster = params.fetch("new_photo_poster")

  new_image = Photo.new 
  new_image.image = input_image
  new_image.caption = input_caption
  new_image.owner_id = input_poster

    render(:template=>"photos/create.html.erb")
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
