class PicturesController < ApplicationController

  def index
    @pictures = []
    if params[:tagged]

      Tag.where(tag: current_user.email).find_each do |tag|
        @pictures.push(Picture.find(tag[:picture_id]))
      end

    else
      @pictures = current_user.pictures
    end
  end

  def new
    @user = current_user
    @picture = Picture.new
    @tags = @picture.tags.build
  end

  def create
    @user = current_user

    if params[:images]
      params[:images].each do |image|
        saved_picture = @user.pictures.create(picture: image)
        binding.pry
        Picture.find(saved_picture).tags.push(Tag.create(tag: params[:picture][:tag]["tag"]))
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
    redirect_to user_pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:picture, :tags, :tagged, :tag)
  end
end
