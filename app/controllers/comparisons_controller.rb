class ComparisonsController < ApplicationController

  def index
    @comparison = Comparison.create
    render 'index'
  end

  def create
    comparison = Comparison.find(params[:comparison_id])
    session_pics = comparison.pictures
    @picture_chosen = Picture.find(params[:id])
    remove_disliked_photo_from_array(params, session_pics)
    if comparison.pictures.count == 1
      render 'result'
    else
      @second_pic = comparison.pic_picker(session_pics)[0]
      while @second_pic == @picture_chosen do
          @second_pic = comparison.pic_picker(session_pics)[0]
      end
        render 'show'
    end
  end

  def remove_disliked_photo_from_array(params, session_pics)
    if params[:id] == params['id1']
      session_pics.delete(Picture.find(params['id2']))
    else
      session_pics.delete(Picture.find(params['id1']))
    end
  end 

end
