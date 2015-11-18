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
    binding.pry
    session_pics.delete(picture_not_chosen) 
    @second_pic = comparison.pic_picker(session_pics)
    #render partial
  end



end
