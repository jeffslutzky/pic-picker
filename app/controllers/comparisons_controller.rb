class ComparisonsController < ApplicationController

  def index
    @comparison = Comparison.create
    render 'index'
  end

  def create
    comparison = Comparison.find(params[:comparison_id])
    session_pics = comparison.pictures
    save_preferred_photo(params, session_pics)

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

  def save_preferred_photo(params, session_pics)
    if params[:id] == params['id1']
      @picture_chosen = Picture.find(params['id1'])
      picture_not_chosen = Picture.find(params['id2'])
    else
      @picture_chosen = Picture.find(params['id2'])
      picture_not_chosen = Picture.find(params['id1'])
    end
    session_pics.delete(picture_not_chosen)
    @picture_chosen
  end 

end
