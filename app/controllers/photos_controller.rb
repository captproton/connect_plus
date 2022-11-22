class PhotosController < ApplicationController
  def index
    if params[:query].present?
      # @photos = Band.where("name LIKE ?", "%#{params[:query]}%")
      @photos = Photo.search("%#{params[:query]}%")
    else
      # query for "ideas"
      @photos = Photo.search("ideas")
    end
  end
end
