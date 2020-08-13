class ImagesController < ApplicationController

  def index
    @image = Image.all
  end

  # def create
  #   Image.create(image_params)
  # end

  # private
  # def image_params
  #   params.require(:image).permit(:image)
  # end
end
