class PhotosController < ApplicationController
  before_action :authenticate_user!



def create

  @place = Place.find(params[:place_id])
  @photo = Photo.create(photo_params.merge(user_id: current_user.id).merge(place_id:params[:place_id]))
  
  redirect_to place_path(@place)
end


private
  def photo_params
    params.require(:photo).permit(:caption, :user_id, :place_id, :picture)
  end
end

