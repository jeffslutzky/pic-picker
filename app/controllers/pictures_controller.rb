class PicturesController < ApplicationController
   

  def index
    comparison = Comparison.find(params[:id])
    session_pics ||= Picture.session_pics
    comparison.associate(session_pics)
    @selected_pics = comparison.pic_picker(session_pics)
    render 'index'
  end

  
  private 
  def picture_params
    params.require(:picture).permit(:photo_url)
  end




end
