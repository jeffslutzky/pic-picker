class PicturesController < ApplicationController

  def index
    session_pics ||= Picture.session_pics
    two_pics = Picture.pic_picker(session_pics)
    
    if two_pics 
      # pic_chosen = Picture.find(params[:id])
      #delete the picture that was not chosen
      @two_pics = two_pics
      # binding.pry
      render 'index'
    else
      @two_pics = Picture.pic_picker(session_pics)
      render 'index'
    end
  end



end
