class PicturesController < ApplicationController

  def index
    @pictures = current_user.pictures
  end

  def new
    @user = current_user
    @picture = Picture.new
  end

  def create
    @user = current_user
    if params[:images]
      params[:images].each do |image|
        @user.pictures.create(picture: image)
      end
      redirect_to user_pictures_path
    else
      flash[:notice] = "No pictures selected!"
      redirect_to :back
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_pictures_path(current_user)
  end

  private

  def picture_params
    params.require(:picture).permit(:picture)
  end
end
