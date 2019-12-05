class ImagesController < ApplicationController
  def destroy
    @image = Image.find(params[:image_id]).destroy

    respond_to do |format|
      format.html {
      }
      format.json { 
        render json: @image
      }
    end
  end
end
