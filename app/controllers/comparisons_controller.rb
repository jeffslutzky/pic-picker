class ComparisonsController < ApplicationController

  def index
    @comparison = Comparison.create
    render 'index'
  end

  def create
    comparison = Comparison.find(params[:comparison_id])
    session_pics = comparison.pictures
    if  params[:id] == params['id1']
      @picture_chosen = Picture.find(params['id1'])
      picture_not_chosen = Picture.find(params['id2'])
    else
      @picture_chosen = Picture.find(params['id2'])
      picture_not_chosen = Picture.find(params['id1'])
    end
    session_pics.delete(picture_not_chosen)

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


end
